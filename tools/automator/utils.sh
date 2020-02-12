#!/usr/bin/env bash

# Copyright Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail

print_error_and_exit() {
  {
    echo
    echo "$1"
    exit "${2:-1}"
  } >&2
}

split_on_commas() {
  local array
  IFS=, read -r -a array <<<"$1"
  echo "${array[@]}"
}

evaluate_tmpl() {
  bash -c "eval echo \"$1\""
}
