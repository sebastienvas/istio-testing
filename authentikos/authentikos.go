/*
Copyright 2019 Istio Authors

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

package main

import (
	"context"
	"flag"
	"time"

	"github.com/spf13/pflag"
	"istio.io/test-infra/authentikos/pkg/authentikos"
	"istio.io/test-infra/authentikos/pkg/plugins/google"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	_ "k8s.io/client-go/plugin/pkg/client/auth" // Enable all auth provider plugins
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/klog"
)

// Command-line options.
const (
	defaultKey       = "token"                 // defaultKey is the kubernetes secret data key.
	defaultSecret    = "authentikos-token"     // defaultSecret is the default kubernetes secret name.
	defaultNamespace = metav1.NamespaceDefault // defaultNamespace is the default kubernetes namespace.
	defaultInterval  = 1 * time.Minute         // defaultInterval is the default tick interval.
)

// createClusterConfig creates kubernetes cluster configuration.
func createClusterConfig() (*rest.Config, error) {
	return clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
		clientcmd.NewDefaultClientConfigLoadingRules(),
		&clientcmd.ConfigOverrides{},
	).ClientConfig()
}

// loadClusterConfig loads kubernetes cluster configuration.
func loadClusterConfig() (*rest.Config, error) {
	if clusterConfig, err := rest.InClusterConfig(); err == nil {
		return clusterConfig, nil
	} else if clusterConfig, err := createClusterConfig(); err == nil {
		return clusterConfig, nil
	} else {
		return nil, err
	}
}

// main entry point.
func main() {
	klog.InitFlags(nil)
	pflag.CommandLine.AddGoFlagSet(flag.CommandLine)
	pflag.Parse()

	g, err := google.NewSecretGenerator()
	if err != nil {
		klog.Exitf("error creating secret generator: %v", err)
	}

	config, err := loadClusterConfig()
	if err != nil {
		klog.Exitf("error loading cluster config: %v", err)
	}
	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		klog.Exitf("error creating k8s clientset: %v", err)
	}

	client := authentikos.NewSecretCreator(clientset.CoreV1(), g)

	ctx := context.Background()
	authentikos.Reconcile(ctx, client, defaultInterval, defaultSecret, defaultNamespace)
}
