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

package authentikos

import (
	"context"
	"testing"
	"time"

	"github.com/google/go-cmp/cmp"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes/fake"
)

type simpleSecretGen struct {
	secret *corev1.Secret
}

func (g *simpleSecretGen) Secret(ctx context.Context, namespace, name string) (*corev1.Secret, error) {
	return g.secret, nil
}

func TestSecretCreator(t *testing.T) {
	ctx := context.Background()
	ns := "default"
	name := "secret"
	secret := &corev1.Secret{
		ObjectMeta: metav1.ObjectMeta{
			Name:      name,
			Namespace: ns,
		},
		Data: map[string][]byte{
			"secret": []byte("hunter2"),
		},
	}
	client := fake.NewSimpleClientset()
	c := &SecretCreator{
		client: client.CoreV1(),
		gen:    &simpleSecretGen{secret: secret},
	}

	t.Run("Create", func(t *testing.T) {
		s, err := c.Create(ctx, ns, name)
		if err != nil {
			t.Fatal(err)
		}
		if diff := cmp.Diff(secret, s); diff != "" {
			t.Error(diff)
		}
	})

	t.Run("Update", func(t *testing.T) {
		// Simulate user annotation of secret. Leave secret gen as is.
		annotatedSecret := &corev1.Secret{
			ObjectMeta: metav1.ObjectMeta{
				Name:        name,
				Namespace:   ns,
				Annotations: map[string]string{"foo": "bar"},
			},
			Data: secret.Data,
		}
		if _, err := client.CoreV1().Secrets(ns).Update(annotatedSecret); err != nil {
			t.Fatalf("Secret.Update: %v", err)
		}
		s, err := c.Create(ctx, ns, name)
		if err != nil {
			t.Fatal(err)
		}
		// User annotations should be preserved.
		if diff := cmp.Diff(annotatedSecret, s); diff != "" {
			t.Error(diff)
		}
	})
}

func TestReconcile_Cancel(t *testing.T) {
	ctx, cancel := context.WithCancel(context.Background())
	cancel()

	// This should effectively be a no-op, since the context is already cancelled.
	Reconcile(ctx, nil, time.Second, "")
}
