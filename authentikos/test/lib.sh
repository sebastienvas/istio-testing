#!/usr/bin/env bash

# Copyright 2020 Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail

export KUBECONFIG
KUBECONFIG=$(mktemp -t kubeconfig-XXXXXXXXXX)

name="authentikos"
image="${IMAGE:-kindest/node:v1.17.11}"
verbosity="${VERBOSITY:-9}"

cleanup_cluster() {
  kind delete cluster --name=$name --verbosity="$verbosity"
}

setup_cluster() {
  kind create cluster --name="$name" --image="$image" --verbosity="$verbosity" --wait=60s
  kind load docker-image gcr.io/istio-testing/authentikos:latest --name="$name"
}

with_timeout() {
  local func="$1" to="${2:-5m}"

  # shellcheck disable=SC2163
  export -f "$func"
  timeout "$to" bash -c "$func"
}

setup_cluster
trap cleanup_cluster EXIT
