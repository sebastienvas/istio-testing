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

package google

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"html/template"
	"io/ioutil"
	"math"
	"os"
	"path/filepath"
	"time"

	"github.com/Masterminds/sprig"
	flag "github.com/spf13/pflag"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/google"
	"google.golang.org/api/option"
	"google.golang.org/api/transport"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	_ "k8s.io/client-go/plugin/pkg/client/auth" // Enable all auth provider plugins
	"k8s.io/klog"
)

// Command-line options.
const (
	defaultKey       = "token"                         // defaultKey is the kubernetes secret data key.
	defaultSecret    = "authentikos-token"             // defaultSecret is the default kubernetes secret name.
	defaultTemplate  = "{{.Token}}"                    // defaultTemplate is the default token template string.
	defaultNamespace = metav1.NamespaceDefault         // defaultNamespace is the default kubernetes namespace.
	defaultInterval  = 30 * time.Minute                // defaultInterval is the default tick interval.
	minInterval      = 1 * time.Minute                 // minInterval is the minimum tick interval (inclusive).
	maxInterval      = tokenExpiration - expiryDelta*2 // maxInterval is the maximum tick interval (exclusive).
)

// OAuth2 scopes.
const (
	userinfoEmailScope = "https://www.googleapis.com/auth/userinfo.email" // View your email address
	cloudPlatformScope = "https://www.googleapis.com/auth/cloud-platform" // View and manage your data across Google Cloud Platform services
	openIDScope        = "openid"                                         // Authenticate using OpenID Connect
)

var (
	defaultScopes = []string{userinfoEmailScope, cloudPlatformScope, openIDScope} // defaultScopes is the default OAuth2 scopes.
)

// Token expiration parameters.
const (
	tokenExpiration = 60 * time.Minute // tokenExpiration is the oauth token expiration.
	maxTries        = 5                // maxTries is the maximum number of consecutive attempts to force refresh a token.
	expiryDelta     = 5 * time.Minute  // expiryDelta is how early a token is be considered expired before its actual expiration time.
)

var timeNow = time.Now

// tokenCreator is a function that creates an oauth token.
type tokenCreator func(forceRefresh bool, tries int) ([]byte, error)

// tokenTemplate is the template data structure.
type tokenTemplate struct {
	Token string
}

// options are the available command-line flags.
type options struct {
	forceRefresh bool
	verbose      bool
	interval     time.Duration
	creds        string
	key          string
	secret       string
	template     string
	templateFile string
	namespace    []string
	scopes       []string
}

var (
	o = options{}
)

func init() {
	flags(&o)
}

func flags(o *options) {
	flag.BoolVarP(&o.forceRefresh, "force-refresh", "r", false, "Force a token refresh. Otherwise, the token will only refresh when necessary.")
	flag.DurationVarP(&o.interval, "interval", "i", defaultInterval, fmt.Sprintf("Token refresh interval [%v - %v).", minInterval, maxInterval))
	flag.StringVarP(&o.creds, "creds", "c", "", "Path to a JSON credentials file.")
	flag.StringVarP(&o.secret, "secret", "o", defaultSecret, "Name of secret to create.")
	flag.StringVarP(&o.key, "key", "k", defaultKey, "Name of secret data key.")
	flag.StringVarP(&o.template, "template", "t", "", "Template string for the token.")
	flag.StringVarP(&o.templateFile, "template-file", "f", "", "Path to a template string for the token.")
	flag.StringSliceVarP(&o.namespace, "namespace", "n", []string{defaultNamespace}, "Namespace(s) to create the secret in.")
	flag.StringSliceVarP(&o.scopes, "scopes", "s", []string{}, "Oauth scope(s) to request for token (see: https://developers.google.com/identity/protocols/oauth2/scopes).")
}

// validateFlags validates the command-line flags.
func (o *options) validateFlags() error {
	var err error

	// Ensure both `template` and `templateFile` are not set.
	if len(o.template) > 0 && len(o.templateFile) > 0 {
		return errors.New("-t, --template and -f, --template-file are mutually exclusive options")
	}

	// Default to `defaultTemplate` if a template is not specified.
	if len(o.template) == 0 && len(o.templateFile) == 0 {
		o.template = defaultTemplate
	}

	// Read in `templateFile` as template if both set and valid.
	if len(o.templateFile) > 0 {
		data, err := ioutil.ReadFile(o.templateFile)
		if err != nil {
			return fmt.Errorf("-f, --template-file option invalid: %v", o.templateFile)
		}
		o.template = string(data)
	}

	if len(o.scopes) == 0 {
		o.scopes = defaultScopes
	}

	// Secrets must have a name, so if unset then default to `defaultSecret`.
	if len(o.secret) == 0 {
		o.secret = defaultSecret
	}

	// Secrets must have a key, so if unset then default to `defaultKey`.
	if len(o.key) == 0 {
		o.key = defaultKey
	}

	// Secrets must have a namespace, so if unset then default to `defaultNamespace`.
	if len(o.namespace) == 0 {
		o.namespace = []string{defaultNamespace}
	}

	// Tick interval must be [1m - 50m), where 60m is the oauth token expiration, 5m is the token expiry delta, and another 5m for processing delta.
	if o.interval < minInterval || o.interval >= maxInterval {
		return fmt.Errorf("-i, --interval option must be in range [%v, %v): %v", minInterval, maxInterval, o.interval)
	}

	if len(o.creds) > 0 {
		if o.creds, err = filepath.Abs(o.creds); err != nil || !fileExists(o.creds) {
			return fmt.Errorf("-c, --creds option invalid: %v", o.creds)
		}
	}

	return nil
}

// fileExists checks if a path exists and is a regular file.
func fileExists(path string) bool {
	info, err := os.Stat(path)
	if os.IsNotExist(err) {
		return false
	}
	return info.Mode().IsRegular()
}

// isExpired determines if a token is expired and needs to be refreshed.
func isExpired(o options, token *oauth2.Token) bool {
	nextRec := timeNow().Add(o.interval)
	expiry := token.Expiry.Add(-expiryDelta)
	isExpired := expiry.Before(nextRec)
	klog.V(1).Infof("expired: %t; token expiry (minus delta): %v; next reconcile: %v\n", isExpired, expiry, nextRec)
	return isExpired
}

// getBackoffTime returns a backoff time calculated using formula: `{backoff factor} * 2 ^ {# of retries}`.
func getBackoffTime(factor float64, retry int) time.Duration {
	return time.Duration(math.Max(factor*math.Exp2(float64(retry)), 0)) * time.Second
}

// withBackoff waits with a backoff and runs a function.
func withBackoff(factor float64, retry int, f interface{}) interface{} {
	time.Sleep(getBackoffTime(factor, retry))
	return f
}

func generateTokenData(o options, data []byte) ([]byte, error) {
	var b bytes.Buffer

	tmpl, err := template.New("TokenData").Funcs(sprig.FuncMap()).Parse(o.template)
	if err != nil {
		return nil, err
	}

	err = tmpl.Execute(&b, &tokenTemplate{Token: string(data)})
	if err != nil {
		return nil, err
	}

	return b.Bytes(), nil

}

// getOauthTokenCreator returns a function that creates/refreshes an oauth token.
func getOauthTokenCreator(o options) (tokenCreator, error) {
	var create tokenCreator

	clientOpts := []option.ClientOption{option.WithScopes(o.scopes...)}

	if len(o.creds) > 0 {
		clientOpts = append(clientOpts, option.WithCredentialsFile(o.creds))
	}

	// Reusing the client leverages the token source cache.
	client, err := transport.Creds(context.Background(), clientOpts...)

	clientCreator := func(forceRefresh bool) (*google.Credentials, error) {
		if forceRefresh {
			// Recreating the client invalidates the token source cache.
			client, err = transport.Creds(context.Background(), clientOpts...)
			klog.V(1).Info("force refreshing token\n", o.verbose)
		}

		return client, err
	}

	create = func(forceRefresh bool, tries int) ([]byte, error) {
		if tries <= 0 {
			return nil, fmt.Errorf("maximum tries: %d exceeded to force refresh token", maxTries)
		}

		client, err := clientCreator(forceRefresh)
		if err != nil {
			return withBackoff(1, maxTries-tries, create).(tokenCreator)(forceRefresh, tries-1)
		}

		token, err := client.TokenSource.Token()
		if err != nil {
			klog.Errorf("error getting token: %v", err)
			return withBackoff(1, maxTries-tries, create).(tokenCreator)(forceRefresh, tries-1)
		}

		if isExpired(o, token) {
			// Force recreate the token if it will expire before the next reconciliation.
			return withBackoff(1, maxTries-tries, create).(tokenCreator)(true, tries-1)
		}

		return []byte(token.AccessToken), nil
	}

	return create, nil
}

type Google struct {
	o options
}

func NewSecretGenerator() (*Google, error) {
	if err := o.validateFlags(); err != nil {
		return nil, err
	}

	return &Google{o: o}, nil
}

func (g *Google) Secret(ctx context.Context, namespace, name string) (*corev1.Secret, error) {
	tokenCreator, err := getOauthTokenCreator(g.o)
	if err != nil {
		klog.Errorf("error getting OAuth creator: %v", err)
		return nil, err
	}

	secretData, err := tokenCreator(g.o.forceRefresh, maxTries)
	if err != nil {
		klog.Errorf("error getting OAuth token: %v", err)
		return nil, err
	}
	data, err := generateTokenData(g.o, secretData)
	if err != nil {
		klog.Errorf("error generating token data: %v", err)
		return nil, err
	}

	return &corev1.Secret{
		ObjectMeta: metav1.ObjectMeta{
			Name:      name,
			Namespace: namespace,
			Labels: map[string]string{
				"app.kubernetes.io/managed-by": "authentikos",
			},
		},
		Data: map[string][]byte{g.o.key: data},
	}, nil
}
