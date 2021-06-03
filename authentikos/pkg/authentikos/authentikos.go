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
	"encoding/json"
	"fmt"
	"strings"
	"time"

	"github.com/mattbaird/jsonpatch"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/types"
	v1 "k8s.io/client-go/kubernetes/typed/core/v1"
	"k8s.io/klog"
)

// SecretGenerator generates a secret for the given namespace/name.
type SecretGenerator interface {
	Secret(ctx context.Context, namespace, name string) (*corev1.Secret, error)
}

// SecretCreator is responsible for creating/updating the Secret resources.
type SecretCreator struct {
	client v1.SecretsGetter
	gen    SecretGenerator
}

// NewSecretCreator creates a new SecretCreator client for the given kubeclient
// + SecretGenerator.
func NewSecretCreator(client v1.SecretsGetter, gen SecretGenerator) *SecretCreator {
	return &SecretCreator{
		client: client,
		gen:    gen,
	}
}

// Create creates or updates the Secret resource. For updates, only the Secret
// data is updated to preserve ObjectMeta fields like labels/annotations.
func (c *SecretCreator) Create(ctx context.Context, namespace, name string) (*corev1.Secret, error) {
	req, err := c.gen.Secret(ctx, namespace, name)
	if err != nil {
		klog.Errorf("error getting secret: %v", err)
		return nil, err
	}
	if secret, err := c.client.Secrets(namespace).Create(req); err == nil {
		klog.V(1).Infof("error creating secret (this may be expected): %v", err)
		return secret, nil
	}

	// Only update the secret data, leave metadata untouched.
	patch, err := json.Marshal([]jsonpatch.JsonPatchOperation{jsonpatch.NewPatch("replace", "/data", req.Data)})
	if err != nil {
		klog.V(1).Infof("error generating patch: %v", err)
		return nil, err
	}
	secret, err := c.client.Secrets(namespace).Patch(req.GetName(), types.JSONPatchType, patch)
	if err != nil {
		klog.Errorf("error patching secret: %v", err)
		return nil, err
	}
	return secret, nil
}

// Reconcile runs a reconciliation loop in order to achieve desired secret state.
func Reconcile(ctx context.Context, client *SecretCreator, interval time.Duration, name string, namespaces ...string) {
	ticker := time.NewTicker(interval)

	work := func(ctx context.Context) {
		var (
			secrets []*corev1.Secret
			errs    namespacedErrors
		)
		for _, ns := range namespaces {
			secret, err := client.Create(ctx, ns, name)
			if err != nil {
				errs = append(errs, &namespacedError{ns, err.Error()})
			} else {
				secrets = append(secrets, secret)
			}
		}
		klog.Info(fmt.Sprintf(
			"%v: reconcile complete; secrets: %v; errors: %v; next reconcile: %vm\n",
			time.Now().Format(time.RFC3339),
			len(secrets),
			len(errs),
			interval.Minutes(),
		))

		if len(errs) > 0 {
			klog.V(1).Info(fmt.Sprintf("errors: %v\n", errs.Errors()))
		}
	}

	for ; ctx.Err() == nil; <-ticker.C {
		work(ctx)
	}
}

// namespacedError is a custom error type which stores a message and a kubernetes namespace.
type namespacedError struct {
	namespace string
	message   string
}

// namespacedError returns the string representation of the error.
func (err namespacedError) Error() string {
	return fmt.Sprintf("%v:%v", err.namespace, err.message)
}

// namespacedError is a list of custom namespaced errors.
type namespacedErrors []*namespacedError

// namespacedErrors returns the string representation of the error(s).
func (errs namespacedErrors) Errors() string {
	var errMsgs []string

	for _, err := range errs {
		errMsgs = append(errMsgs, err.Error())
	}

	return strings.Join(errMsgs, ", ")
}
