// Copyright 2017 Istio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package util

import (
	"context"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
	"time"

	"github.com/google/go-github/github"
	multierror "github.com/hashicorp/go-multierror"
	"golang.org/x/oauth2"
)

var (
	commitType = "commit"
)

const (
	maxCommitDistance   = 200
	releaseBodyTemplate = `
[ARTIFACTS](http://gcsweb.istio.io/gcs/istio-release/releases/{{.ReleaseTag}}/)

[RELEASE NOTES](http://github.com/istio/istio/wiki/v{{.ReleaseTag}})`
)

// GithubClient masks RPCs to github as local procedures
type GithubClient struct {
	client *github.Client
	owner  string
	token  string
}

// NewGithubClient creates a new GithubClient with proper authentication
func NewGithubClient(owner, token string) *GithubClient {
	ts := oauth2.StaticTokenSource(&oauth2.Token{AccessToken: token})
	tc := oauth2.NewClient(context.Background(), ts)
	client := github.NewClient(tc)
	return &GithubClient{client, owner, token}
}

// NewGithubClientNoAuth creates a new GithubClient without authentication
// useful when only making GET requests
func NewGithubClientNoAuth(owner string) *GithubClient {
	client := github.NewClient(nil)
	return &GithubClient{client, owner, ""}
}

// SHAIsAncestorOfBranch checks if sha is ancestor of branch
func (g GithubClient) SHAIsAncestorOfBranch(repo, branch, targetSHA string) (bool, error) {
	log.Printf("Checking if %s is ancestor of branch %s", targetSHA, branch)
	sha, err := g.GetHeadCommitSHA(repo, branch)
	if err != nil {
		return false, err
	}
	noEarlierThan, err := g.GetCommitCreationTime(repo, targetSHA)
	if err != nil {
		return false, err
	}
	for i := 0; i < maxCommitDistance; i++ {
		if targetSHA == sha {
			return true, nil
		}
		commit, _, err := g.client.Repositories.GetCommit(
			context.Background(), g.owner, repo, sha)
		if err != nil {
			return false, err
		}
		creationTime, err := g.GetCommitCreationTime(repo, sha)
		if err != nil {
			return false, err
		}
		if creationTime.Before(noEarlierThan) {
			return false, nil
		}
		sha = *commit.Parents[0].SHA
	}
	err = fmt.Errorf("exceed max iterations %d", maxCommitDistance)
	return false, err
}

// FastForward moves :branch on :repo to the given sha
func (g GithubClient) FastForward(repo, branch, sha string) error {
	ref := fmt.Sprintf("refs/heads/%s", branch)
	log.Printf("Updating ref %s to commit %s on repo %s", ref, sha, repo)
	refType := "commit"
	gho := github.GitObject{
		SHA:  &sha,
		Type: &refType,
	}
	r := github.Reference{
		Ref:    &ref,
		Object: &gho,
	}
	r.Ref = new(string)
	*r.Ref = ref
	_, _, err := g.client.Git.UpdateRef(
		context.Background(), g.owner, repo, &r, false)
	return err
}

// Remote generates the url to the remote repository on github
// embedded with username and token
func (g GithubClient) Remote(repo string) string {
	return fmt.Sprintf(
		"https://%s:%s@github.com/%s/%s.git",
		g.owner, g.token, g.owner, repo,
	)
}

// CreatePullRequest within :repo from :branch to :baseBranch
// releaseNote is a necessary part and will automatically set to "none" if caller leaves it empty.
func (g GithubClient) CreatePullRequest(
	title, body, releaseNote, branch, baseBranch, repo string) (*github.PullRequest, error) {
	if releaseNote == "" {
		releaseNote = ReleaseNoteNone
	}
	body += fmt.Sprintf("\r\n```release-note\r\n%s\r\n```", releaseNote)
	req := github.NewPullRequest{
		Head:  &branch,
		Base:  &baseBranch,
		Title: &title,
		Body:  &body,
	}
	log.Printf("Creating a PR with Title: \"%s\" for repo %s", title, repo)
	pr, _, err := g.client.PullRequests.Create(
		context.Background(), g.owner, repo, &req)
	if err != nil {
		return nil, err
	}
	log.Printf("Created new PR at %s", *pr.HTMLURL)
	return pr, nil
}

// AddAutoMergeLabelsToPR adds /lgtm and /approve labels to a PR,
// essentially automatically merges the PR without review, if PR passes presubmit
func (g GithubClient) AddAutoMergeLabelsToPR(repo string, pr *github.PullRequest) error {
	return g.AddlabelsToPR(repo, pr, "lgtm", "approved", "release-note-none")
}

// AddlabelsToPR adds labels to the pull request
func (g GithubClient) AddlabelsToPR(
	repo string, pr *github.PullRequest, labels ...string) error {
	_, _, err := g.client.Issues.AddLabelsToIssue(
		context.Background(), g.owner, repo, pr.GetNumber(), labels)
	return err
}

// ClosePRDeleteBranch closes a PR and deletes the branch from which the PR is made
func (g GithubClient) ClosePRDeleteBranch(repo string, pr *github.PullRequest) error {
	prName := fmt.Sprintf("%s/%s#%d", g.owner, repo, pr.GetNumber())
	prBranch := *pr.Head.Ref
	log.Printf("Closing PR %s", prName)
	*pr.State = "closed"
	if _, _, err := g.client.PullRequests.Edit(
		context.Background(), g.owner, repo, pr.GetNumber(), pr); err != nil {
		log.Printf("Failed to close %s", prName)
		return err
	}
	prBranchExists, err := g.ExistBranch(repo, prBranch)
	if err != nil {
		return err
	}
	if prBranchExists {
		ref := fmt.Sprintf("refs/heads/%s", *pr.Head.Ref)
		log.Printf("Deleting branch %s", prBranch)
		if _, err := g.client.Git.DeleteRef(context.Background(), g.owner, repo, ref); err != nil {
			log.Printf("Failed to delete branch %s in repo %s", *pr.Head.Ref, repo)
			return err
		}
	}
	return nil
}

// MergePR force merges a PR
func (g GithubClient) MergePR(repo string, pr *github.PullRequest) error {
	prName := fmt.Sprintf("%s/%s#%d", g.owner, repo, pr.GetNumber())
	if _, _, err := g.client.Repositories.Merge(
		context.Background(), g.owner, repo, &github.RepositoryMergeRequest{
			Base:          pr.Base.Ref,
			Head:          pr.Head.Ref,
			CommitMessage: nil,
		}); err != nil {
		log.Printf("Failed to merge %s", prName)
		return err
	}
	return nil
}

// ListRepos returns a list of repos under the provided owner
func (g GithubClient) ListRepos() ([]string, error) {
	opt := &github.RepositoryListOptions{Type: "owner"}
	repos, _, err := g.client.Repositories.List(context.Background(), g.owner, opt)
	if err != nil {
		return nil, err
	}
	var listRepoNames []string
	for _, r := range repos {
		listRepoNames = append(listRepoNames, *r.Name)
	}
	return listRepoNames, nil
}

// ExistBranch checks if a given branch name has already existed on remote repo
// Must get a full list of branches and iterate through since
// fetching a nonexisting branch directly results in error
func (g GithubClient) ExistBranch(repo, branch string) (bool, error) {
	branches, _, err := g.client.Repositories.ListBranches(
		context.Background(), g.owner, repo, nil)
	if err != nil {
		return false, err
	}
	for _, b := range branches {
		if b.GetName() == branch {
			return true, nil
		}
	}
	return false, nil
}

// GetPRTestResults return `success` if all *required* tests have passed
func (g GithubClient) GetPRTestResults(repo string, pr *github.PullRequest, verbose bool) (string, error) {
	combinedStatus, _, err := g.client.Repositories.GetCombinedStatus(
		context.Background(), g.owner, repo, pr.Head.GetSHA(), nil)
	if err != nil {
		return "", err
	}
	if verbose {
		log.Printf("---------- The following jobs are triggered ----------\n")
		for _, status := range combinedStatus.Statuses {
			log.Printf("> %s\t%s\n", status.GetContext(), status.GetTargetURL())
		}
	}
	requiredChecks, _, err := g.client.Repositories.GetRequiredStatusChecks(
		context.Background(), g.owner, repo, pr.Base.GetRef())
	if err != nil {
		return "", err
	}
	if verbose {
		log.Printf("---------- The following jobs are required to pass ----------\n")
		for _, ctx := range requiredChecks.Contexts {
			log.Printf("> %s\n", ctx)
		}
	}
	return GetReqquiredCIState(combinedStatus, requiredChecks, nil), nil
}

// CloseIdlePullRequests checks all open PRs auto-created on baseBranch in repo,
// closes the ones that have stayed open for a long time, and deletes the
// remote branches from which the PRs are made
func (g GithubClient) CloseIdlePullRequests(prTitlePrefix, repo, baseBranch string) error {
	log.Printf("If any, close failed auto PRs to update dependencies in repo %s", repo)
	idleTimeout := time.Hour * 6
	var multiErr error
	checkPR := func(prState string) {
		options := github.PullRequestListOptions{
			State: prState,
		}
		prs, _, err := g.client.PullRequests.List(
			context.Background(), g.owner, repo, &options)
		if err != nil {
			multiErr = multierror.Append(multiErr, err)
			return
		}
		for _, pr := range prs {
			if !strings.HasPrefix(*pr.Title, prTitlePrefix) {
				continue
			}
			if time.Since(*pr.CreatedAt).Nanoseconds() > idleTimeout.Nanoseconds() {
				if err := g.ClosePRDeleteBranch(repo, pr); err != nil {
					multiErr = multierror.Append(multiErr, err)
				}
			}
		}
	}
	checkPR("open")
	checkPR("closed")
	return multiErr
}

// GetHeadCommitSHA finds the SHA of the commit to which the HEAD of branch points
func (g GithubClient) GetHeadCommitSHA(repo, branch string) (string, error) {
	sha, _, err := g.GetReferenceSHAAndType(repo, "refs/heads/"+branch)
	return sha, err
}

// GetTagCommitSHA finds the SHA of the commit from which the tag was made
func (g GithubClient) GetTagCommitSHA(repo, tag string) (string, error) {
	sha, ty, err := g.GetReferenceSHAAndType(repo, "refs/tags/"+tag)
	if err != nil {
		return "", err
	}

	if ty == "tag" {
		tagObj, _, err := g.client.Git.GetTag(context.Background(), g.owner, repo, sha)
		if err != nil {
			log.Printf("Failed to get tag object %s", sha)
			return "", err
		}
		return *tagObj.Object.SHA, nil
	} else if ty == "commit" {
		commitObj, _, err := g.client.Git.GetCommit(context.Background(), g.owner, repo, sha)
		if err != nil {
			log.Printf("Failed to get commit object %s", sha)
			return "", err
		}
		return *commitObj.SHA, nil
	}
	return "", fmt.Errorf("unknown type of tag, %s", err)
}

// GetCommitCreationTime gets the time when the commit identified by sha is created
func (g GithubClient) GetCommitCreationTime(repo, sha string) (time.Time, error) {
	commit, _, err := g.client.Git.GetCommit(
		context.Background(), g.owner, repo, sha)
	if err != nil {
		log.Printf("Failed to get commit %s", sha)
		return time.Time{}, err
	}
	return commit.Author.GetDate(), nil
}

// GetCommitCreationTimeByTag finds the time when the commit pointed by a tag is created
// Note that SHA of the tag is different from the commit SHA
func (g GithubClient) GetCommitCreationTimeByTag(repo, tag string) (time.Time, error) {
	commitSHA, err := g.GetTagCommitSHA(repo, tag)
	if err != nil {
		return time.Time{}, err
	}
	return g.GetCommitCreationTime(repo, commitSHA)
}

// GetReleaseTagCreationTime gets the creation time of a lightweight tag created by release
// Release tags from istio/istio are this kind of tag.
func (g GithubClient) GetReleaseTagCreationTime(repo, tag string) (time.Time, error) {
	release, _, err := g.client.Repositories.GetReleaseByTag(context.Background(), g.owner, repo, tag)
	if err != nil {
		return time.Time{}, fmt.Errorf("failed to get release tag: %s", err)
	}
	return release.GetCreatedAt().Time, nil
}

// GetannotatedTagCreationTime gets the creation time of an annotated Tag
// Release tags except those from istio/istio are annotated tag.
func (g GithubClient) GetannotatedTagCreationTime(repo, tag string) (time.Time, error) {
	sha, ty, err := g.GetReferenceSHAAndType(repo, "refs/tags/"+tag)
	if err != nil {
		return time.Time{}, err
	}

	if ty != "tag" {
		return time.Time{}, fmt.Errorf("refs/tags/%s is not pointing to a tag object", tag)
	}

	tagObject, _, err := g.client.Git.GetTag(context.Background(), g.owner, repo, sha)
	if err != nil {
		return time.Time{}, fmt.Errorf("failed to get tag object: %s", err)
	}
	return tagObject.Tagger.GetDate(), nil
}

// GetFileContent retrieves the file content from the hosted repo
func (g GithubClient) GetFileContent(repo, branch, path string) (string, error) {
	opt := github.RepositoryContentGetOptions{branch}
	fileContent, _, _, err := g.client.Repositories.GetContents(
		context.Background(), g.owner, repo, path, &opt)
	if err != nil {
		return "", err
	}
	return fileContent.GetContent()
}

// CreateAnnotatedTag creates on the remote repo an annotated tag at given sha
func (g GithubClient) CreateAnnotatedTag(repo, tag, sha, msg string) error {
	if !SHARegex.MatchString(sha) {
		return fmt.Errorf(
			"unable to create tag %s on repo %s: invalid commit SHA %s",
			tag, repo, sha)
	}
	tagObj := github.Tag{
		Tag:     &tag,
		Message: &msg,
		Object: &github.GitObject{
			Type: &commitType,
			SHA:  &sha,
		},
	}
	tagResponse, _, err := g.client.Git.CreateTag(
		context.Background(), g.owner, repo, &tagObj)
	if err != nil {
		log.Printf("Failed to create tag %s on repo %s", tag, repo)
		return err
	}
	refString := "refs/tags/" + tag
	refObj := github.Reference{
		Ref: &refString,
		Object: &github.GitObject{
			Type: &commitType,
			SHA:  tagResponse.SHA,
		},
	}
	_, _, err = g.client.Git.CreateRef(
		context.Background(), g.owner, repo, &refObj)
	if err != nil {
		log.Printf("Failed to create reference with tag %s\n", tag)
	}
	return err
}

// CreateReleaseUploadArchives creates a release given release tag and
// upload all files in archiveDir as assets of this release
func (g GithubClient) CreateReleaseUploadArchives(repo, releaseTag, sha, archiveDir string) error {
	// create release
	release := github.RepositoryRelease{
		TagName:         &releaseTag,
		TargetCommitish: &sha,
	}
	// Setting release to pre release and draft such that it does not send an announcement.
	newBool := func(b bool) *bool {
		bb := b
		return &bb
	}
	release.Draft = newBool(true)
	release.Prerelease = newBool(true)
	releaseBody, err := FillUpTemplate(releaseBodyTemplate, map[string]string{"ReleaseTag": releaseTag})
	if err != nil {
		return err
	}
	release.Body = &releaseBody
	log.Printf("Creating on github new %s release [%s]\n", repo, releaseTag)
	res, _, err := g.client.Repositories.CreateRelease(
		context.Background(), g.owner, repo, &release)
	if err != nil {
		log.Printf("Failed to create new release on repo %s with releaseTag: %s", repo, releaseTag)
		return err
	}
	releaseID := *res.ID
	// upload archives
	files, err := ioutil.ReadDir(archiveDir)
	if err != nil {
		return err
	}
	for _, f := range files {
		log.Printf("Uploading asset %s\n", f.Name())
		filePath := fmt.Sprintf("%s/%s", archiveDir, f.Name())
		fd, err := os.Open(filePath)
		if err != nil {
			return err
		}
		opt := github.UploadOptions{f.Name()}
		_, _, err = g.client.Repositories.UploadReleaseAsset(
			context.Background(), g.owner, repo, releaseID, &opt, fd)
		if err != nil {
			log.Printf("Failed to upload asset %s to release %s on repo %s: %s",
				f.Name(), releaseTag, g.owner, repo)
			return err
		}
	}
	return nil
}

// GetReferenceSHAAndType returns the sha of a reference
func (g GithubClient) GetReferenceSHAAndType(repo, ref string) (string, string, error) {
	githubRefObj, _, err := g.client.Git.GetRef(
		context.Background(), g.owner, repo, ref)
	if err != nil {
		log.Printf("Failed to get reference SHA -- %s", ref)
		return "", "", err
	}
	return *githubRefObj.Object.SHA, *githubRefObj.Object.Type, nil
}

// SearchIssues get issues/prs based on query
func (g GithubClient) SearchIssues(queries []string, keyWord, sort, order string) (*github.IssuesSearchResult, error) {
	q := strings.Join(queries, " ")
	searchOption := &github.SearchOptions{
		Sort:  sort,
		Order: order,
	}

	issueResult, _, err := g.client.Search.Issues(context.Background(), q, searchOption)
	if err != nil {
		log.Printf("Failed to search issues")
		return nil, err
	}

	return issueResult, nil
}

// GetLatestRelease get the latest release version
func (g GithubClient) GetLatestRelease(repo string) (string, error) {
	release, _, err := g.client.Repositories.GetLatestRelease(context.Background(), g.owner, repo)
	if err != nil {
		return "", err
	}
	return *release.TagName, nil
}

// CreatePRUpdateRepo checkout repo:baseBranch to local
// create newBranch, do edit(), push newBranch
// and create a PR again baseBranch with prTitle and prBody
func (g GithubClient) CreatePRUpdateRepo(
	newBranch, baseBranch, repo, prTitle, prBody string, edit func() error) (*github.PullRequest, error) {
	workDir, err := os.Getwd()
	if err != nil {
		return nil, fmt.Errorf("failed to get current working dir: %s", err)
	}
	log.Printf("Cloning %s to local and checkout %s\n", repo, baseBranch)
	repoDir, err := CloneRepoCheckoutBranch(&g, repo, baseBranch, newBranch)
	if err != nil {
		return nil, err
	}
	defer func() {
		if err = RemoveLocalRepo(repoDir); err != nil {
			log.Fatalf("Error during clean up: %v\n", err)
		}
		if err = os.Chdir(workDir); err != nil {
			log.Printf("Failed to go back to workDir %s: %s", workDir, err)
		}
	}()
	if err = edit(); err != nil {
		return nil, err
	}
	log.Printf("Staging commit and creating pull request\n")
	if err = CreateCommitPushToRemote(
		newBranch, newBranch); err != nil {
		return nil, err
	}
	return g.CreatePullRequest(prTitle, prBody, "", newBranch, baseBranch, repo)
}
