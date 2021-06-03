// Copyright 2020 Istio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package github

import (
	"context"

	"github.com/bradleyfalzon/ghinstallation"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/klog"
)

const (
	maxAttempts = 3
)

// GitHubApp is a SecretGenerator for populating GitHub App Installation
// access tokens in secrets. This generator creates a BasicAuth secret
// so that it may be used for general API operations, as well as HTTP
// based git clones.
type GitHubApp struct {
	tr tokenizer
}

// tokenizer creates new GitHub App installation tokens. This is primarily used
// for ease of testing so we don't have to use a real Installation transport.
type tokenizer interface {
	Token(ctx context.Context) (string, error)
}

// NewSecretGenerator returns a new GitHub App SecretGenerator
// for the given GitHub App installation transport.
func NewSecretGenerator(tr *ghinstallation.Transport) *GitHubApp {
	return &GitHubApp{
		tr: tr,
	}
}

func (a *GitHubApp) token(ctx context.Context) ([]byte, error) {
	var token string
	var err error
	for i := 0; i < maxAttempts; i++ {
		token, err = a.tr.Token(ctx)
		if err == nil {
			break
		}
		klog.Warning(err)
	}
	return []byte(token), err
}

// Secret generates a new Secret for the GitHub App installation.
func (a *GitHubApp) Secret(ctx context.Context, namespace, name string) (*corev1.Secret, error) {
	data, err := a.token(ctx)
	if err != nil {
		return nil, err
	}
	return &corev1.Secret{
		Type: corev1.SecretTypeBasicAuth,
		ObjectMeta: metav1.ObjectMeta{
			Name:      name,
			Namespace: namespace,
		},
		// See https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#http-based-git-access-by-an-installation
		// for username/password format.
		Data: map[string][]byte{
			"username": []byte("x-access-token"),
			"password": data,
		},
	}, nil
}
