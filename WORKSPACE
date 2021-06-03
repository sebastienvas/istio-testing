workspace(name = "io_istio_test_infra")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "io_k8s_repo_infra",
    sha256 = "5ee2a8e306af0aaf2844b5e2c79b5f3f53fc9ce3532233f0615b8d0265902b2a",
    strip_prefix = "repo-infra-0.0.1-alpha.1",
    urls = [
        "https://github.com/kubernetes/repo-infra/archive/v0.0.1-alpha.1.tar.gz",
    ],
)

load("@io_k8s_repo_infra//:load.bzl", "repositories")

repositories()

http_archive(
    name = "bazel_toolchains",
    sha256 = "dcb58e7e5f0b4da54c6c5f8ebc65e63fcfb37414466010cf82ceff912162296e",
    strip_prefix = "bazel-toolchains-0.28.2",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/0.28.2.tar.gz",
        "https://github.com/bazelbuild/bazel-toolchains/archive/0.28.2.tar.gz",
    ],
)

load("@bazel_toolchains//rules:rbe_repo.bzl", "rbe_autoconfig")

rbe_autoconfig(name = "rbe_default")

http_archive(
    name = "com_google_protobuf",
    sha256 = "2ee9dcec820352671eb83e081295ba43f7a4157181dad549024d7070d079cf65",
    strip_prefix = "protobuf-3.9.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.9.0.tar.gz"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# buildifier is written in Go and hence needs rules_go to be built.
# See https://github.com/bazelbuild/rules_go for the up to date setup instructions.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "8df59f11fb697743cbb3f26cfb8750395f30471e9eabde0d174c3aebc7a1cd39",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.19.1/rules_go-0.19.1.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/0.19.1/rules_go-0.19.1.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "be9296bfd64882e3c08e3283c58fcb461fa6dd3c171764fcc4cf322f60615a9b",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
    ],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "d8440da64ac15eca922ca0e8c6772bbb04eaaf3d2f4de387e5bfdb87cecbe9d2",
    strip_prefix = "buildtools-0.28.0",
    url = "https://github.com/bazelbuild/buildtools/archive/0.28.0.zip",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(go_version = "1.12.7")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

buildifier_dependencies()

##
## python
##

git_repository(
    name = "io_bazel_rules_python",
    commit = "fdbb17a4118a1728d19e638a5291b4c4266ea5b8",
    remote = "https://github.com/bazelbuild/rules_python.git",
    shallow_since = "1557865590 -0400",
)

load("@io_bazel_rules_python//python:pip.bzl", "pip_import")

pip_import(
    name = "py_deps",
    requirements = "//:requirements.txt",
)

load("@py_deps//:requirements.bzl", "pip_install")

pip_install()

##
## docker
##

# You *must* import the Go rules before setting up the go_image rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "87fc6a2b128147a0a3039a2fd0b53cc1f2ed5adb8716f50756544a572999ae9a",
    strip_prefix = "rules_docker-0.8.1",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.8.1.tar.gz"],
)

load("@io_bazel_rules_docker//repositories:repositories.bzl", _container_repos = "repositories")

_container_repos()

load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

load("@//:repos.bzl", "go_repositories")

# gazelle:repository_macro repos.bzl%go_repositories
go_repositories()
