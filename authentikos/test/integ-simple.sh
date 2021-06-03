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

ROOT="$(cd -P "$(dirname -- "$0")" && pwd -P)"

# shellcheck disable=SC1090
source "$ROOT/lib.sh"

timout="5m"

get_tokeninfo() {
  local token

  while [ -z "${token:-}" ]; do
    sleep 5
    token=$(kubectl get secrets authentikos-token --output=jsonpath='{.data.token}' | base64 --decode)
  done

  curl -sSfL "https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=$token"
}

run_test() {
  set -xe

  local tokeninfo="$1"

  echo "Test 'error' is null"
  [[ $(echo "$tokeninfo" | jq -r '.error') == 'null' ]] || exit 1

  echo "Test 'issued_to' exists"
  [[ $(echo "$tokeninfo" | jq -r '.issued_to') != "null" ]] || exit 1

  echo "Test 'audience' exists"
  [[ $(echo "$tokeninfo" | jq -r '.audience') != "null" ]] || exit 1

  echo "Test 'user_id' exists"
  [[ $(echo "$tokeninfo" | jq -r '.user_id') != "null" ]] || exit 1

  echo "Test 'email' exists"
  [[ $(echo "$tokeninfo" | jq -r '.email') != "null" ]] || exit 1

  echo "Test 'expires_in' greater than 0"
  [[ $(echo "$tokeninfo" | jq -r '.expires_in') -gt 0 ]] || exit 1

  echo "Test 'scope' includes 'userinfo.email', 'cloud-platform', and 'openid'"
  echo "$tokeninfo" | jq -r '.scope' |
    grep -w "openid" |
    grep -w "https://www.googleapis.com/auth/cloud-platform" |
    grep -w "https://www.googleapis.com/auth/userinfo.email" >/dev/null
}

main() {
  kubectl create secret generic service-account --from-file="service-account.json=$GOOGLE_APPLICATION_CREDENTIALS"
  kubectl apply --filename="$ROOT/testdata/authentikos-simple.yaml"
  kubectl wait deployment authentikos --for="condition=available" --timeout="$timout"

  run_test "$(with_timeout get_tokeninfo "$timout")"
}

main
