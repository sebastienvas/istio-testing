# Copyright 2019 Istio Authors
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

PROJECT = istio-testing
HUB = gcr.io
VERSION ?= 0.0.6

.PHONY: deploy
deploy: image push

.PHONY: image
image:
	docker build -t "$(HUB)/$(PROJECT)/authentikos:$(VERSION)" -t "$(HUB)/$(PROJECT)/authentikos:latest" .

.PHONY: push
push:
	docker push "$(HUB)/$(PROJECT)/authentikos:$(VERSION)"
	docker push "$(HUB)/$(PROJECT)/authentikos:latest"

.PHONY: unit-test
unit-test:
	@go test ./...

.PHONY: integ-test
integ-test: image
	@bash ./test/integ-simple.sh

.PHONY: test
test: unit-test integ-test
