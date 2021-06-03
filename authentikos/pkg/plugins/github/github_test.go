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
	"testing"

	"github.com/google/go-cmp/cmp"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

const (
	token = "hunter2"
)

type fakeToken struct{}

func (fakeToken) Token(ctx context.Context) (string, error) {
	return token, nil
}

func TestGitHubApp(t *testing.T) {
	ctx := context.Background()
	gh := &GitHubApp{tr: fakeToken{}}

	want := &corev1.Secret{
		Type: corev1.SecretTypeBasicAuth,
		ObjectMeta: metav1.ObjectMeta{
			Name:      "secret",
			Namespace: "default",
		},
		Data: map[string][]byte{
			"username": []byte("x-access-token"),
			"password": []byte(token),
		},
	}

	s, err := gh.Secret(ctx, want.GetNamespace(), want.GetName())
	if err != nil {
		t.Fatal(err)
	}
	if diff := cmp.Diff(want, s); diff != "" {
		t.Error(diff)
	}
}
