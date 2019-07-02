#!/bin/bash
# Copyright 2017 Istio Authors

#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at

#       http://www.apache.org/licenses/LICENSE-2.0

#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

set -o nounset
set -o errexit
set -o pipefail
set -o xtrace

cd "$(bazel info workspace)"
trap 'echo "FAILED" >&2' ERR

prune-vendor() {
  find vendor -type f \
    -not -iname "*.c" \
    -not -iname "*.go" \
    -not -iname "*.h" \
    -not -iname "*.proto" \
    -not -iname "*.s" \
    -not -iname "AUTHORS*" \
    -not -iname "CONTRIBUTORS*" \
    -not -iname "COPYING*" \
    -not -iname "LICENSE*" \
    -not -iname "NOTICE*" \
    -exec rm '{}' \;
}

rm -rf vendor
export GO111MODULE=on
bazel run @go_sdk//:bin/go -- mod tidy
bazel run //:gazelle -- update-repos --from_file=go.mod
bazel run @go_sdk//:bin/go -- mod vendor
prune-vendor
"$(dirname "$0")"/update_bazel.sh
