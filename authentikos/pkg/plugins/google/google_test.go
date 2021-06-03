/*
Copyright 2020 Istio Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package google

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"reflect"
	"testing"
	"time"

	"github.com/spf13/pflag"
	"golang.org/x/oauth2"
)

func makeFile(t *testing.T, data string) string {
	t.Helper()

	f, err := ioutil.TempFile("", "")
	if err != nil {
		t.Fatalf("ioutil.TempFile: %v", err)
	}
	fname := f.Name()

	if err := ioutil.WriteFile(fname, []byte(data), 0644); err != nil {
		t.Fatalf("ioutil.WriteFile: %v", err)
	}

	return fname
}

func TestValidateFlags(t *testing.T) {
	template := "{{.Token}}"

	validTFile := makeFile(t, template)

	// Simulate invalid/deleted files by generating a path, but has no file.
	deletedCredsFile := filepath.Join(os.TempDir(), fmt.Sprintf("deleted-creds-%d", time.Now().Unix()))
	invalidTFile := filepath.Join(os.TempDir(), fmt.Sprintf("invalid-%d", time.Now().Unix()))

	os.Remove(deletedCredsFile)
	defer os.Remove(validTFile)

	testCases := []struct {
		name         string
		args         []string
		expectedErr  bool
		postValidate func(options) bool
	}{
		{
			name: "template defaults to defaultTemplate if is zero",
			args: []string{"--template="},
			postValidate: func(o options) bool {
				return o.template == defaultTemplate
			},
		},
		{
			name: "template (if unset) should be set to contents of template-file",
			args: []string{"--template=", "--template-file=" + validTFile},
			postValidate: func(o options) bool {
				return o.template == template
			},
		},
		{
			name: "scopes defaults to defaultScopes if is zero",
			args: []string{"--scopes="},
			postValidate: func(o options) bool {
				return reflect.DeepEqual(o.scopes, defaultScopes)
			},
		},
		{
			name: "secret defaults to defaultSecret if is zero",
			args: []string{"--secret="},
			postValidate: func(o options) bool {
				return o.secret == defaultSecret
			},
		},
		{
			name: "key default to defaultKey if is zero",
			args: []string{"--key="},
			postValidate: func(o options) bool {
				return o.key == defaultKey
			},
		},
		{
			name: "namespace default to defaultNamespace if is zero",
			args: []string{"--namespace="},
			postValidate: func(o options) bool {
				return reflect.DeepEqual(o.namespace, []string{defaultNamespace})
			},
		},
		{
			name:        "error: template and template-file are mutually exclusive",
			args:        []string{"--template=" + template, "--template-file=/path/to/file"},
			expectedErr: true,
		},
		{
			name:        "error: template-file unreadable",
			args:        []string{"--template-file=" + invalidTFile},
			expectedErr: true,
		},
		{
			name:        "error: creds does not exist",
			args:        []string{"--creds=" + deletedCredsFile},
			expectedErr: true,
		},
		{
			name:        fmt.Sprintf("error: interval < minInterval(%v)", minInterval),
			args:        []string{"--interval=0m"},
			expectedErr: true,
		},
		{
			name:        fmt.Sprintf("error: interval == maxInterval(%v)", maxInterval),
			args:        []string{"--interval=50m"},
			expectedErr: true,
		},
		{
			name:        fmt.Sprintf("error: interval >= maxInterval(%v)", maxInterval),
			args:        []string{"--interval=51m"},
			expectedErr: true,
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {

			o = options{}

			os.Args = []string{"authentikos"}
			os.Args = append(os.Args, tc.args...)
			pflag.CommandLine = pflag.NewFlagSet(os.Args[0], pflag.ExitOnError)
			flags(&o)
			pflag.Parse()

			t.Logf("Options (pre-validate):  %+v", o)
			t.Cleanup(func() { t.Logf("Options (post-validate): %+v", o) })

			if err := o.validateFlags(); (err != nil) != tc.expectedErr {
				t.Fatalf("expected error: %t != actual error: %t: %v", tc.expectedErr, err != nil, err)
			}

			if tc.postValidate != nil {
				if !tc.postValidate(o) {
					t.Fatalf("validation failed")
				}
			}
		})
	}
}

func TestIsExpired(t *testing.T) {
	now := time.Now()
	timeNow = func() time.Time {
		return now
	}

	testCases := []struct {
		name     string
		interval time.Duration
		token    func(interval time.Duration) *oauth2.Token
		expected bool
	}{
		{
			name:     "Expired because token expiry is in the past",
			interval: defaultInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(-(100 * time.Minute))}
			},
			expected: true,
		},
		{
			name:     "Expired because token expiry plus expiryDelta is before the next reconciliation",
			interval: defaultInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta).Add(defaultInterval).Add(-(1 * time.Minute))}
			},
			expected: true,
		},
		{
			name:     "Expired because token expiry is within the expiryDelta of the next reconciliation",
			interval: defaultInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta / 2).Add(defaultInterval)}
			},
			expected: true,
		},
		{
			name:     "Not expired because token expiry plus expiryDelta is equal to the next reconciliation",
			interval: defaultInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta).Add(defaultInterval)}
			},
			expected: false,
		},
		{
			name:     "Not expired because token expiry plus expiryDelta is after the next reconciliation",
			interval: defaultInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta).Add(defaultInterval).Add(1 * time.Minute)}
			},
			expected: false,
		},
		{
			name:     "Expired if token expiry is < maxInterval",
			interval: maxInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta).Add(maxInterval).Add(-(1 * time.Minute))}
			},
			expected: true,
		},
		{
			name:     "Not expired if token expiry is == maxInterval",
			interval: maxInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta).Add(maxInterval)}
			},
			expected: false,
		},
		{
			name:     "Not expired if token expiry is >= maxInterval",
			interval: maxInterval,
			token: func(interval time.Duration) *oauth2.Token {
				return &oauth2.Token{Expiry: timeNow().Add(expiryDelta).Add(maxInterval).Add(1 * time.Minute)}
			},
			expected: false,
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			o := options{interval: tc.interval, verbose: true}
			actual := isExpired(o, tc.token(tc.interval))
			if tc.expected != actual {
				t.Errorf("expected: %v != actual: %v", tc.expected, actual)
			}
		})
	}
}

func TestGetBackoffTime(t *testing.T) {
	testCases := []struct {
		name          string
		retry         int
		backoffFactor float64
		expected      time.Duration
	}{
		{
			name:          "Retry 0 (i.e. try 1) with a backoff factor 1 should backoff for 1 seconds",
			retry:         0,
			backoffFactor: 1,
			expected:      1 * time.Second,
		},
		{
			name:          "Retry 4 with a backoff factor 1 should backoff for 16 seconds",
			retry:         4,
			backoffFactor: 1,
			expected:      16 * time.Second,
		},
		{
			name:          "Retry 2 with a backoff factor 0.5 should backoff for 2 seconds",
			retry:         2,
			backoffFactor: 0.5,
			expected:      2 * time.Second,
		},
		{
			name:          "Negative backoff factor should return 0 backoff time",
			retry:         3,
			backoffFactor: -2,
			expected:      0,
		},
		{
			name:          "Negative retry number should return 0 backoff time",
			retry:         -5,
			backoffFactor: 1,
			expected:      0,
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			actual := getBackoffTime(tc.backoffFactor, tc.retry)
			if tc.expected != actual {
				t.Errorf("expected: %v != actual: %v", tc.expected, actual)
			}
		})
	}
}
