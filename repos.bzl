load("@bazel_gazelle//:deps.bzl", "go_repository")

def go_repositories():
    go_repository(
        name = "cc_mvdan_interfacer",
        commit = "c20040233aed",
        importpath = "mvdan.cc/interfacer",
    )

    go_repository(
        name = "cc_mvdan_lint",
        commit = "adc824a0674b",
        importpath = "mvdan.cc/lint",
    )

    go_repository(
        name = "cc_mvdan_unparam",
        commit = "cc9d2fb52971",
        importpath = "mvdan.cc/unparam",
    )

    go_repository(
        name = "cc_mvdan_xurls_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "mvdan.cc/xurls/v2",
        sum = "h1:r1zSOSNS/kqtpmATyMMMvaZ4/djsesbYz5kr0+qMRWc=",
        version = "v2.0.0",
    )
    go_repository(
        name = "co_honnef_go_tools",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "honnef.co/go/tools",
        sum = "h1:/8zB6iBfHCl1qAnEAWwGPNrUvapuy6CPla1VM0k8hQw=",
        version = "v0.0.0-20190106161140-3f1c8253044a",
    )

    go_repository(
        name = "com_4d63_gochecknoglobals",
        commit = "abbdf6ec0afb",
        importpath = "4d63.com/gochecknoglobals",
    )

    go_repository(
        name = "com_4d63_gochecknoinits",
        commit = "14d5915061e5",
        importpath = "4d63.com/gochecknoinits",
    )

    go_repository(
        name = "com_github_alecthomas_gocyclo",
        commit = "aa8f8b160214",
        importpath = "github.com/alecthomas/gocyclo",
    )

    go_repository(
        name = "com_github_alecthomas_template",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/alecthomas/template",
        sum = "h1:JYp7IbQjafoB+tBA3gMyHYHrpOtNuDiK/uB5uXxq5wM=",
        version = "v0.0.0-20190718012654-fb15b899a751",
    )
    go_repository(
        name = "com_github_alecthomas_units",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/alecthomas/units",
        sum = "h1:Hs82Z41s6SdL1CELW+XaDYmOH4hkBN4/N9og/AsOv7E=",
        version = "v0.0.0-20190717042225-c3de453c63f4",
    )
    go_repository(
        name = "com_github_alexflint_go_arg",
        importpath = "github.com/alexflint/go-arg",
        tag = "v1.0.0",
    )

    go_repository(
        name = "com_github_alexflint_go_scalar",
        importpath = "github.com/alexflint/go-scalar",
        tag = "v1.0.0",
    )

    go_repository(
        name = "com_github_alexkohler_nakedret",
        commit = "c0e305a4f690",
        importpath = "github.com/alexkohler/nakedret",
    )

    go_repository(
        name = "com_github_andygrunwald_go_gerrit",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/andygrunwald/go-gerrit",
        sum = "h1:uUuUZipfD5nPl2L/i0I3N4iRKJcoO2CPjktaH/kP9gQ=",
        version = "v0.0.0-20190120104749-174420ebee6c",
    )
    go_repository(
        name = "com_github_apache_thrift",
        importpath = "github.com/apache/thrift",
        sum = "h1:pODnxUFNcjP9UTLZGTdeh+j16A8lJbRvD3rOtrk/7bs=",
        version = "v0.12.0",
    )
    go_repository(
        name = "com_github_armon_consul_api",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/armon/consul-api",
        sum = "h1:G1bPvciwNyF7IUmKXNt9Ak3m6u9DE1rF+RmtIkBpVdA=",
        version = "v0.0.0-20180202201655-eb2c6b5be1b6",
    )

    go_repository(
        name = "com_github_asaskevich_govalidator",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/asaskevich/govalidator",
        sum = "h1:eg0MeVzsP1G42dRafH3vf+al2vQIJU0YHX+1Tw87oco=",
        version = "v0.0.0-20180720115003-f9ffefc3facf",
    )
    go_repository(
        name = "com_github_aws_aws_k8s_tester",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/aws/aws-k8s-tester",
        sum = "h1:B7prfUXk9GHnMc/a7NrEY29IJRgI4/2cCbHDqQJGgLs=",
        version = "v0.0.0-20190114231546-b411acf57dfe",
    )
    go_repository(
        name = "com_github_aws_aws_sdk_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/aws/aws-sdk-go",
        sum = "h1:POeH34ZME++pr7GBGh+ZO6Y5kOwSMQpqp5BGUgooJ6k=",
        version = "v1.16.36",
    )
    go_repository(
        name = "com_github_azure_azure_pipeline_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/Azure/azure-pipeline-go",
        sum = "h1:u7JFb9fFTE6Y/j8ae2VK33ePrRqJqoCM/IWkQdAZ+rg=",
        version = "v0.1.9",
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/Azure/azure-sdk-for-go",
        sum = "h1:43w4ZSx8u8wh5tgs1P+hO5Dgjh5bhP0qAlEnCdAuMQA=",
        version = "v21.1.0+incompatible",
    )
    go_repository(
        name = "com_github_azure_azure_storage_blob_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/Azure/azure-storage-blob-go",
        sum = "h1:QjGHsWFbJyl312t0BtgkmZy2TTYA++FF0UakGbr3ZhQ=",
        version = "v0.0.0-20190123011202-457680cc0804",
    )

    go_repository(
        name = "com_github_azure_go_ansiterm",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/Azure/go-ansiterm",
        sum = "h1:w+iIsaOQNcT7OZ575w+acHgRric5iCyQh+xv+KJ4HB8=",
        version = "v0.0.0-20170929234023-d6e3b3328b78",
    )
    go_repository(
        name = "com_github_azure_go_autorest",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/Azure/go-autorest",
        sum = "h1:viZ3tV5l4gE2Sw0xrasFHytCGtzYCrT+um/rrSQ1BfA=",
        version = "v11.1.2+incompatible",
    )
    go_repository(
        name = "com_github_azure_go_autorest_autorest",
        importpath = "github.com/Azure/go-autorest/autorest",
        sum = "h1:MRvx8gncNaXJqOoLmhNjUAKh33JJF8LyxPhomEtOsjs=",
        version = "v0.9.0",
    )
    go_repository(
        name = "com_github_azure_go_autorest_autorest_adal",
        importpath = "github.com/Azure/go-autorest/autorest/adal",
        sum = "h1:q2gDruN08/guU9vAjuPWff0+QIrpH6ediguzdAzXAUU=",
        version = "v0.5.0",
    )
    go_repository(
        name = "com_github_azure_go_autorest_autorest_date",
        importpath = "github.com/Azure/go-autorest/autorest/date",
        sum = "h1:YGrhWfrgtFs84+h0o46rJrlmsZtyZRg470CqAXTZaGM=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_azure_go_autorest_autorest_mocks",
        importpath = "github.com/Azure/go-autorest/autorest/mocks",
        sum = "h1:Ww5g4zThfD/6cLb4z6xxgeyDa7QDkizMkJKe0ysZXp0=",
        version = "v0.2.0",
    )
    go_repository(
        name = "com_github_azure_go_autorest_logger",
        importpath = "github.com/Azure/go-autorest/logger",
        sum = "h1:ruG4BSDXONFRrZZJ2GUXDiUyVpayPmb1GnWeHDdaNKY=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_azure_go_autorest_tracing",
        importpath = "github.com/Azure/go-autorest/tracing",
        sum = "h1:TRn4WjSnkcSy5AEG3pnbtFSwNtwzjr4VYyQflFE619k=",
        version = "v0.5.0",
    )

    go_repository(
        name = "com_github_bazelbuild_bazel_gazelle",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/bazelbuild/bazel-gazelle",
        sum = "h1:nJsPG30GPtJUtYmjU4NEpnGp3nsRFN46ROgh6pawuhw=",
        version = "v0.18.1",
    )
    go_repository(
        name = "com_github_bazelbuild_buildtools",
        importpath = "github.com/bazelbuild/buildtools",
        sum = "h1:WHyHxJd9ZTyyXqlEuheY93v4cPJLBy0SIEshPCcK0xQ=",
        version = "v0.0.0-20190404153937-93253d6efaa9",
    )
    go_repository(
        name = "com_github_beorn7_perks",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/beorn7/perks",
        sum = "h1:VlbKKnNfV8bJzeqoa4cOKqO6bYr3WgKZxO8Z16+hsOM=",
        version = "v1.0.1",
    )

    go_repository(
        name = "com_github_bgentry_speakeasy",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/bgentry/speakeasy",
        sum = "h1:ByYyxL9InA1OWqxJqqp2A5pYHUrCiAL6K3J+LKSsQkY=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_blang_semver",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/blang/semver",
        sum = "h1:cQNTCjp13qL8KC3Nbxr/y2Bqb63oX6wdnnjpJbkM4JQ=",
        version = "v3.5.1+incompatible",
    )
    go_repository(
        name = "com_github_bradleyfalzon_ghinstallation",
        importpath = "github.com/bradleyfalzon/ghinstallation",
        sum = "h1:pmBXkxgM1WeF8QYvDLT5kuQiHMcmf+X015GI0KM/E3I=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_burntsushi_toml",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/BurntSushi/toml",
        sum = "h1:WXkYYl6Yr3qBf1K79EBnL4mak0OimBfB0XUf9Vl28OQ=",
        version = "v0.3.1",
    )

    go_repository(
        name = "com_github_burntsushi_xgb",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/BurntSushi/xgb",
        sum = "h1:1BDTz0u9nC3//pOCMdNH+CiXJVYJh5UQNCOBG7jbELc=",
        version = "v0.0.0-20160522181843-27f122750802",
    )
    go_repository(
        name = "com_github_bwmarrin_snowflake",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/bwmarrin/snowflake",
        sum = "h1:dRbqXFjM10uA3wdrVZ8Kh19uhciRMOroUYJ7qAqDLhY=",
        version = "v0.0.0",
    )

    go_repository(
        name = "com_github_cespare_xxhash_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/cespare/xxhash/v2",
        sum = "h1:yTUvW7Vhb89inJ+8irsUqiWjh8iT6sQPZiQzI6ReGkA=",
        version = "v2.1.0",
    )
    go_repository(
        name = "com_github_clarketm_json",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/clarketm/json",
        sum = "h1:gvWCzx4JHbBeVPpSV9LVr+PXfRInRnDy80D9nnTLULs=",
        version = "v1.13.0",
    )
    go_repository(
        name = "com_github_client9_misspell",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/client9/misspell",
        sum = "h1:ta993UF76GwbvJcIo3Y68y/M3WxlpEHPWIGDkJYwzJI=",
        version = "v0.3.4",
    )

    go_repository(
        name = "com_github_coreos_bbolt",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/bbolt",
        sum = "h1:uTXKg9gY70s9jMAKdfljFQcuh4e/BXOM+V+d00KFj3A=",
        version = "v1.3.1-coreos.6",
    )
    go_repository(
        name = "com_github_coreos_etcd",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/etcd",
        sum = "h1:8F3hqu9fGYLBifCmRCJsicFqDx/D68Rt3q1JMazcgBQ=",
        version = "v3.3.13+incompatible",
    )
    go_repository(
        name = "com_github_coreos_go_etcd",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/go-etcd",
        sum = "h1:bXhRBIXoTm9BYHS3gE0TtQuyNZyeEMux2sDi4oo5YOo=",
        version = "v2.0.0+incompatible",
    )

    go_repository(
        name = "com_github_coreos_go_oidc",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/go-oidc",
        sum = "h1:X+JQSgXg3CcxgcBoMAqU8NoS0fch8zHxjiKWcXclxaI=",
        version = "v0.0.0-20180117170138-065b426bd416",
    )
    go_repository(
        name = "com_github_coreos_go_semver",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/go-semver",
        sum = "h1:3Jm3tLmsgAYcjC+4Up7hJrFBPr+n7rAqYeSw/SZazuY=",
        version = "v0.2.0",
    )
    go_repository(
        name = "com_github_coreos_go_systemd",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/go-systemd",
        sum = "h1:u9SHYsPQNyt5tgDm3YN7+9dYrpK96E5wFilTFWIDZOM=",
        version = "v0.0.0-20180511133405-39ca1b05acc7",
    )
    go_repository(
        name = "com_github_coreos_pkg",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/coreos/pkg",
        sum = "h1:n2Ltr3SrfQlf/9nOna1DoGKxLx3qTSI8Ttl6Xrqp6mw=",
        version = "v0.0.0-20180108230652-97fdf19511ea",
    )
    go_repository(
        name = "com_github_cpuguy83_go_md2man",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/cpuguy83/go-md2man",
        sum = "h1:BSKMNlYxDvnunlTymqtgONjNnaRV1sTpcovwwjF22jk=",
        version = "v1.0.10",
    )
    go_repository(
        name = "com_github_davecgh_go_spew",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/davecgh/go-spew",
        sum = "h1:vj9j/u1bqnvCEfJOwUhtlOARqs3+rkHYY13jYWTU97c=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_deckarep_golang_set",
        importpath = "github.com/deckarep/golang-set",
        sum = "h1:njG8LmGD6JCWJu4bwIKmkOHvch70UOEIqczl5vp7Gok=",
        version = "v0.0.0-20171013212420-1d4478f51bed",
    )

    go_repository(
        name = "com_github_denisenkom_go_mssqldb",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/denisenkom/go-mssqldb",
        sum = "h1:M0bjbJ5PZPl4iKkt0FSvhfSCJI9NisDDda29jXN9i0c=",
        version = "v0.0.0-20190111225525-2fea367d496d",
    )
    go_repository(
        name = "com_github_dgrijalva_jwt_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/dgrijalva/jwt-go",
        sum = "h1:7qlOGliEKZXTDg6OTjfoBKDXWrumCAMpl/TFQ4/5kLM=",
        version = "v3.2.0+incompatible",
    )
    go_repository(
        name = "com_github_djherbis_atime",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/djherbis/atime",
        sum = "h1:ySLvBAM0EvOGaX7TI4dAM5lWj+RdJUCKtGSEHN8SGBg=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_docker_cli",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/cli",
        sum = "h1:KrSeY2qJPl1blFLllwCMBIgwilomqEte/nb8dPhqY2o=",
        version = "v0.0.0-20190925022749-754388324470",
    )
    go_repository(
        name = "com_github_docker_distribution",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/distribution",
        sum = "h1:W1rhCpxfWMU0CaZSFWpmWfmB68zYZVksig+VC1ZbgI4=",
        version = "v2.6.0-rc.1.0.20180327202408-83389a148052+incompatible",
    )
    go_repository(
        name = "com_github_docker_docker",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/docker",
        sum = "h1:7X3lPJrEEhoUt1UnISqyUB4phKf9aAKVMdFXD63DJO8=",
        version = "v1.4.2-0.20180531152204-71cd53e4a197",
    )

    go_repository(
        name = "com_github_docker_docker_credential_helpers",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/docker-credential-helpers",
        sum = "h1:zI2p9+1NQYdnG6sMU26EX4aVGlqbInSQxQXLvzJ4RPQ=",
        version = "v0.6.3",
    )
    go_repository(
        name = "com_github_docker_go_connections",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/go-connections",
        sum = "h1:El9xVISelRB7BuFusrZozjnkIM5YnzCViNKohAFqRJQ=",
        version = "v0.4.0",
    )
    go_repository(
        name = "com_github_docker_go_units",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/go-units",
        sum = "h1:Xk8S3Xj5sLGlG5g67hJmYMmUgXv5N4PhkjJHHqrwnTk=",
        version = "v0.3.3",
    )

    go_repository(
        name = "com_github_docker_spdystream",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docker/spdystream",
        sum = "h1:cenwrSVm+Z7QLSV/BsnenAOcDXdX4cMv4wP0B/5QbPg=",
        version = "v0.0.0-20160310174837-449fdfce4d96",
    )
    go_repository(
        name = "com_github_docopt_docopt_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/docopt/docopt-go",
        sum = "h1:bWDMxwH3px2JBh6AyO7hdCn/PkvCZXii8TGj7sbtEbQ=",
        version = "v0.0.0-20180111231733-ee0de3bc6815",
    )
    go_repository(
        name = "com_github_dustin_go_humanize",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/dustin/go-humanize",
        sum = "h1:VSnTsYCnlFHaM2/igO1h6X3HA71jcobQuxemgkq4zYo=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_eapache_go_resiliency",
        importpath = "github.com/eapache/go-resiliency",
        sum = "h1:1NtRmCAqadE2FN4ZcN6g90TP3uk8cg9rn9eNK2197aU=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_eapache_go_xerial_snappy",
        importpath = "github.com/eapache/go-xerial-snappy",
        sum = "h1:YEetp8/yCZMuEPMUDHG0CW/brkkEp8mzqk2+ODEitlw=",
        version = "v0.0.0-20180814174437-776d5712da21",
    )
    go_repository(
        name = "com_github_eapache_queue",
        importpath = "github.com/eapache/queue",
        sum = "h1:YOEu7KNc61ntiQlcEeUIoDTJ2o8mQznoNvUhiigpIqc=",
        version = "v1.1.0",
    )

    go_repository(
        name = "com_github_elazarl_goproxy",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/elazarl/goproxy",
        sum = "h1:p1yVGRW3nmb85p1Sh1ZJSDm4A4iKLS5QNbvUHMgGu/M=",
        version = "v0.0.0-20170405201442-c4fc26588b6e",
    )
    go_repository(
        name = "com_github_emicklei_go_restful",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/emicklei/go-restful",
        sum = "h1:H2pdYOb3KQ1/YsqVWoWNLQO+fusocsw354rqGTZtAgw=",
        version = "v0.0.0-20170410110728-ff4f55a20633",
    )
    go_repository(
        name = "com_github_erikstmartin_go_testdb",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/erikstmartin/go-testdb",
        sum = "h1:Yzb9+7DPaBjB8zlTR87/ElzFsnQfuHnVUVqpZZIcV5Y=",
        version = "v0.0.0-20160219214506-8d10e4a1bae5",
    )
    go_repository(
        name = "com_github_evanphx_json_patch",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/evanphx/json-patch",
        sum = "h1:ouOWdg56aJriqS0huScTkVXPC5IcNrDCXZ6OoTAWu7M=",
        version = "v4.5.0+incompatible",
    )
    go_repository(
        name = "com_github_fatih_color",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/fatih/color",
        sum = "h1:DkWD4oS2D8LGGgTQ6IvwJJXSL5Vp2ffcQg58nFV38Ys=",
        version = "v1.7.0",
    )
    go_repository(
        name = "com_github_fsnotify_fsnotify",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/fsnotify/fsnotify",
        sum = "h1:IXs+QLmnXW2CcXuY+8Mzv/fWEsPGWxqefPtCP5CnV9I=",
        version = "v1.4.7",
    )

    go_repository(
        name = "com_github_fsouza_fake_gcs_server",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/fsouza/fake-gcs-server",
        sum = "h1:3iml5UHzQtk3cpnYfqW16Ia+1xSuu9tc4BElZu5470M=",
        version = "v0.0.0-20180612165233-e85be23bdaa8",
    )
    go_repository(
        name = "com_github_ghodss_yaml",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/ghodss/yaml",
        sum = "h1:ZktWZesgun21uEDrwW7iEV1zPCGQldM2atlJZ3TdvVM=",
        version = "v0.0.0-20150909031657-73d445a93680",
    )

    go_repository(
        name = "com_github_globalsign_mgo",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/globalsign/mgo",
        sum = "h1:DujepqpGd1hyOd7aW59XpK7Qymp8iy83xq74fLr21is=",
        version = "v0.0.0-20181015135952-eeefdecb41b8",
    )
    go_repository(
        name = "com_github_go_gl_glfw",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-gl/glfw",
        sum = "h1:QbL/5oDUmRBzO9/Z7Seo6zf912W/a6Sr4Eu0G/3Jho0=",
        version = "v0.0.0-20190409004039-e6da0acd62b1",
    )
    go_repository(
        name = "com_github_go_kit_kit",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-kit/kit",
        sum = "h1:wDJmvq38kDhkVxi50ni9ykkdUr1PKgqKOoi01fa0Mdk=",
        version = "v0.9.0",
    )
    go_repository(
        name = "com_github_go_logfmt_logfmt",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-logfmt/logfmt",
        sum = "h1:MP4Eh7ZCb31lleYCFuwm0oe4/YGak+5l1vA2NOE80nA=",
        version = "v0.4.0",
    )
    go_repository(
        name = "com_github_go_logr_logr",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-logr/logr",
        sum = "h1:M1Tv3VzNlEHg6uyACnRdtrploV2P7wZqH8BoQMtz0cg=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_go_logr_zapr",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-logr/zapr",
        sum = "h1:qXBXPDdNncunGs7XeEpsJt8wCjYBygluzfdLO0G5baE=",
        version = "v0.1.1",
    )

    go_repository(
        name = "com_github_go_openapi_analysis",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/analysis",
        sum = "h1:eYp14J1o8TTSCzndHBtsNuckikV1PfZOSnx4BcBeu0c=",
        version = "v0.17.2",
    )
    go_repository(
        name = "com_github_go_openapi_errors",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/errors",
        sum = "h1:azEQ8Fnx0jmtFF2fxsnmd6I0x6rsweUF63qqSO1NmKk=",
        version = "v0.17.2",
    )
    go_repository(
        name = "com_github_go_openapi_jsonpointer",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/jsonpointer",
        sum = "h1:wSt/4CYxs70xbATrGXhokKF1i0tZjENLOo1ioIO13zk=",
        version = "v0.0.0-20160704185906-46af16f9f7b1",
    )
    go_repository(
        name = "com_github_go_openapi_jsonreference",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/jsonreference",
        sum = "h1:tF+augKRWlWx0J0B7ZyyKSiTyV6E1zZe+7b3qQlcEf8=",
        version = "v0.0.0-20160704190145-13c6e3589ad9",
    )

    go_repository(
        name = "com_github_go_openapi_loads",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/loads",
        sum = "h1:tEXYu6Xc0pevpzzQx5ghrMN9F7IVpN/+u4iD3rkYE5o=",
        version = "v0.17.2",
    )
    go_repository(
        name = "com_github_go_openapi_runtime",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/runtime",
        sum = "h1:/ZK67ikFhQAMFFH/aPu2MaGH7QjP4wHBvHYOVIzDAw0=",
        version = "v0.17.2",
    )
    go_repository(
        name = "com_github_go_openapi_spec",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/spec",
        sum = "h1:C1JKChikHGpXwT5UQDFaryIpDtyyGL/CR6C2kB7F1oc=",
        version = "v0.0.0-20160808142527-6aced65f8501",
    )

    go_repository(
        name = "com_github_go_openapi_strfmt",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/strfmt",
        sum = "h1:1isAxYf//QDTnVzbLAMrUK++0k1EjeLJU/gTOR0o3Mc=",
        version = "v0.17.0",
    )
    go_repository(
        name = "com_github_go_openapi_swag",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/swag",
        sum = "h1:zP3nY8Tk2E6RTkqGYrarZXuzh+ffyLDljLxCy1iJw80=",
        version = "v0.0.0-20160704191624-1d0bd113de87",
    )

    go_repository(
        name = "com_github_go_openapi_validate",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-openapi/validate",
        sum = "h1:PVXYcP1GkTl+XIAJnyJxOmK6CSG5Q1UcvoCvNO++5Kg=",
        version = "v0.18.0",
    )
    go_repository(
        name = "com_github_go_sql_driver_mysql",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-sql-driver/mysql",
        sum = "h1:cRYCw9putX9pmpNdGkE/rWrY6gNGqZvdgGT1RPl6K18=",
        version = "v0.0.0-20160411075031-7ebe0a500653",
    )
    go_repository(
        name = "com_github_go_stack_stack",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-stack/stack",
        sum = "h1:5SgMzNM5HxrEjV0ww2lTmX6E2Izsfxas4+YHWRs3Lsk=",
        version = "v1.8.0",
    )
    go_repository(
        name = "com_github_go_yaml_yaml",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/go-yaml/yaml",
        sum = "h1:RYi2hDdss1u4YE7GwixGzWwVo47T8UQwnTLB6vQiq+o=",
        version = "v2.1.0+incompatible",
    )

    go_repository(
        name = "com_github_gobuffalo_envy",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gobuffalo/envy",
        sum = "h1:OsV5vOpHYUpP7ZLS6sem1y40/lNX1BZj+ynMiRi21lQ=",
        version = "v1.6.15",
    )
    go_repository(
        name = "com_github_gogo_protobuf",
        build_file_generation = "on",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gogo/protobuf",
        sum = "h1:3PaI8p3seN09VjbTYC/QWlUZdZ1qS1zGjy7LH2Wt07I=",
        version = "v1.2.2-0.20190723190241-65acae22fc9d",
    )

    go_repository(
        name = "com_github_golang_collections_collections",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/golang-collections/collections",
        sum = "h1:zN2lZNZRflqFyxVaTIU61KNKQ9C0055u9CAfpmqUvo4=",
        version = "v0.0.0-20130729185459-604e922904d3",
    )
    go_repository(
        name = "com_github_golang_glog",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/golang/glog",
        sum = "h1:VKtxabqXZkF25pY9ekfRL6a582T4P37/31XEstQ5p58=",
        version = "v0.0.0-20160126235308-23def4e6c14b",
    )

    go_repository(
        name = "com_github_golang_groupcache",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/golang/groupcache",
        sum = "h1:LbsanbbD6LieFkXbj9YNNBupiGHJgFeLpO0j0Fza1h8=",
        version = "v0.0.0-20160516000752-02826c3e7903",
    )
    go_repository(
        name = "com_github_golang_lint",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/golang/lint",
        sum = "h1:2hRPrmiwPrp3fQX967rNJIhQPtiGXdlQWAxKbKw3VHA=",
        version = "v0.0.0-20180702182130-06c8688daad7",
    )

    go_repository(
        name = "com_github_golang_mock",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/golang/mock",
        sum = "h1:28o5sBqPkBsMGnC6b4MvE2TzSr5/AT4c/1fLqVGIwlk=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_golang_protobuf",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/golang/protobuf",
        sum = "h1:6nsPYzhq5kReh6QImI3k5qWzO4PEbvbIW2cwSfR/6xs=",
        version = "v1.3.2",
    )

    go_repository(
        name = "com_github_golang_snappy",
        importpath = "github.com/golang/snappy",
        sum = "h1:woRePGFeVFfLKN/pOkfl+p/TAqKOfFu+7KPlMVpok/w=",
        version = "v0.0.0-20180518054509-2e65f85255db",
    )
    go_repository(
        name = "com_github_gomodule_redigo",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gomodule/redigo",
        sum = "h1:ZKld1VOtsGhAe37E7wMxEDgAlGM5dvFY+DiOhSkhP9Y=",
        version = "v1.7.0",
    )
    go_repository(
        name = "com_github_google_btree",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/btree",
        sum = "h1:964Od4U6p2jUkFxvCydnIczKteheJEzHRToSGK3Bnlw=",
        version = "v0.0.0-20180813153112-4030bb1f1f0c",
    )

    go_repository(
        name = "com_github_google_go_cmp",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/go-cmp",
        sum = "h1:Xye71clBPdm5HgqGwUkwhbynsUJZhDbS20FvLhQ2izg=",
        version = "v0.3.1",
    )

    go_repository(
        name = "com_github_google_go_containerregistry",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/go-containerregistry",
        sum = "h1:i2MA7D3vtR5uk9ZPzVp/IC9616kCPv0RScyRD/tVQGM=",
        version = "v0.0.0-20191010200024-a3d713f9b7f8",
    )
    go_repository(
        name = "com_github_google_go_github",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/go-github",
        sum = "h1:N0LgJ1j65A7kfXrZnUDaYCs/Sf4rEjNlfyDHW9dolSY=",
        version = "v17.0.0+incompatible",
    )
    go_repository(
        name = "com_github_google_go_github_v29",
        importpath = "github.com/google/go-github/v29",
        sum = "h1:opYN6Wc7DOz7Ku3Oh4l7prmkOMwEcQxpFtxdU8N8Pts=",
        version = "v29.0.2",
    )

    go_repository(
        name = "com_github_google_go_querystring",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/go-querystring",
        sum = "h1:Xkwi/a1rcvNg1PPYe5vI8GbeBY/jrVuDX5ASuANWTrk=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_google_gofuzz",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/gofuzz",
        sum = "h1:A8PeW59pxE9IoFRqBp37U+mSNaQoZ46F1f0f863XSXw=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_google_martian",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/martian",
        sum = "h1:/CP5g8u/VJHijgedC/Legn3BAbAaWPgecwXBIDzw5no=",
        version = "v2.1.0+incompatible",
    )
    go_repository(
        name = "com_github_google_pprof",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/pprof",
        sum = "h1:eqyIo2HjKhKe/mJzTG8n4VqvLXIOEG+SLdDqX7xGtkY=",
        version = "v0.0.0-20181206194817-3ea8567a2e57",
    )

    go_repository(
        name = "com_github_google_renameio",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/renameio",
        sum = "h1:GOZbcHa3HfsPKPlmyPyN2KEohoMXOhdMbHrvbpl2QaA=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_google_uuid",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/google/uuid",
        sum = "h1:Gkbcsh/GbpXz7lPftLA3P6TYMwjCLYm83jiFQZF/3gY=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_googleapis_gax_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/googleapis/gax-go",
        sum = "h1:j0GKcs05QVmm7yesiZq2+9cxHkNK9YM6zKx4D2qucQU=",
        version = "v2.0.0+incompatible",
    )

    go_repository(
        name = "com_github_googleapis_gax_go_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/googleapis/gax-go/v2",
        sum = "h1:hU4mGcQI4DaAYW+IbTun+2qEZVFxK0ySjQLTbS0VQKc=",
        version = "v2.0.4",
    )
    go_repository(
        name = "com_github_googleapis_gnostic",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/googleapis/gnostic",
        sum = "h1:7XGaL1e6bYS1yIonGp9761ExpPPV1ui0SAC59Yube9k=",
        version = "v0.0.0-20170729233727-0c5108395e2d",
    )

    go_repository(
        name = "com_github_googlecloudplatform_testgrid",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/GoogleCloudPlatform/testgrid",
        sum = "h1:CyF0eU2zgmEnZSlo2tlTYuzHu7etOg07+WwuE4kVn58=",
        version = "v0.0.0-20191016232453-9f0319fc1197",
    )
    go_repository(
        name = "com_github_gophercloud_gophercloud",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gophercloud/gophercloud",
        sum = "h1:P/nh25+rzXouhytV2pUHBb65fnds26Ghl8/391+sT5o=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_gordonklaus_ineffassign",
        commit = "1003c8bd00dc",
        importpath = "github.com/gordonklaus/ineffassign",
    )
    go_repository(
        name = "com_github_gorilla_context",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gorilla/context",
        sum = "h1:AWwleXJkX/nhcU9bZSnZoi3h/qGYqQAGhq6zZe/aQW8=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_gorilla_csrf",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gorilla/csrf",
        sum = "h1:wua1OxOTarfqtUVfiSvzs2zTr3qV57cXVGclVETJXXc=",
        version = "v1.6.1",
    )
    go_repository(
        name = "com_github_gorilla_mux",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gorilla/mux",
        sum = "h1:Pgr17XVTNXAk3q/r4CpKzC5xBM/qW1uVLV+IhRZpIIk=",
        version = "v1.6.2",
    )
    go_repository(
        name = "com_github_gorilla_securecookie",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gorilla/securecookie",
        sum = "h1:miw7JPhV+b/lAHSXz4qd/nN9jRiAFV5FwjeKyCS8BvQ=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_gorilla_sessions",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gorilla/sessions",
        sum = "h1:uXoZdcdA5XdXF3QzuSlheVRUvjl+1rKY7zBXL68L9RU=",
        version = "v1.1.3",
    )

    go_repository(
        name = "com_github_gorilla_websocket",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gorilla/websocket",
        sum = "h1:Lh2aW+HnU2Nbe1gqD9SOJLJxW1jBMmQOktN2acDyJk8=",
        version = "v0.0.0-20170926233335-4201258b820c",
    )

    go_repository(
        name = "com_github_gotestyourself_gotestyourself",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gotestyourself/gotestyourself",
        sum = "h1:AQwinXlbQR2HvPjQZOmDhRqsv5mZf+Jb1RnSLxcqZcI=",
        version = "v2.2.0+incompatible",
    )
    go_repository(
        name = "com_github_gregjones_httpcache",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/gregjones/httpcache",
        sum = "h1:6TSoaYExHper8PYsJu23GWVNOyYRCSnIFyxKgLSZ54w=",
        version = "v0.0.0-20170728041850-787624de3eb7",
    )

    go_repository(
        name = "com_github_grpc_ecosystem_go_grpc_middleware",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/grpc-ecosystem/go-grpc-middleware",
        sum = "h1:Iju5GlWwrvL6UBg4zJJt3btmonfrMlCDdsejg4CZE7c=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_grpc_ecosystem_go_grpc_prometheus",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/grpc-ecosystem/go-grpc-prometheus",
        sum = "h1:Ovs26xHkKqVztRpIrF/92BcuyuQ/YW4NSIpoGtfXNho=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_grpc_ecosystem_grpc_gateway",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/grpc-ecosystem/grpc-gateway",
        sum = "h1:pX7cnDwSSmG0dR9yNjCQSSpmsJOqFdT7SzVp5Yl9uVw=",
        version = "v1.4.1",
    )
    go_repository(
        name = "com_github_hashicorp_errwrap",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/hashicorp/errwrap",
        sum = "h1:hLrqtEDnRye3+sgx6z4qVLNuviH3MR5aQ0ykNJa/UYA=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_hashicorp_go_multierror",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/hashicorp/go-multierror",
        sum = "h1:iVjPR7a6H0tWELX5NxNe7bYopibicUzc7uPribsnS6o=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_hashicorp_golang_lru",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/hashicorp/golang-lru",
        sum = "h1:0hERBMJE1eitiLkihrMvRVBYAkpHzc/J3QdDN+dAcgU=",
        version = "v0.5.1",
    )
    go_repository(
        name = "com_github_hashicorp_hcl",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/hashicorp/hcl",
        sum = "h1:0Anlzjpi4vEasTeNFn2mLJgTSwt0+6sfsiTG8qcWGx4=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_hpcloud_tail",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/hpcloud/tail",
        sum = "h1:nfCOvKYfkgYP8hkirhJocXT2+zOD8yUNjXaWfTlyFKI=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_huandu_xstrings",
        importpath = "github.com/huandu/xstrings",
        sum = "h1:gvV6jG9dTgFEncxo+AF7PH6MZXi/vZl25owA/8Dg8Wo=",
        version = "v1.3.0",
    )

    go_repository(
        name = "com_github_imdario_mergo",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/imdario/mergo",
        sum = "h1:JboBksRwiiAJWvIYJVo46AfV+IAIKZpfrSzVKj42R4Q=",
        version = "v0.3.5",
    )

    go_repository(
        name = "com_github_inconshreveable_mousetrap",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/inconshreveable/mousetrap",
        sum = "h1:Z8tu5sraLXCXIcARxBp/8cbvlwVa7Z1NHg9XEKhtSvM=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_influxdata_influxdb",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/influxdata/influxdb",
        sum = "h1:AciJ2ei/llFRundm7CtqwF6B2aOds1A7QG3sMW8QiaQ=",
        version = "v0.0.0-20161215172503-049f9b42e9a5",
    )
    go_repository(
        name = "com_github_jgautheron_goconst",
        commit = "9740945f5dcb",
        importpath = "github.com/jgautheron/goconst",
    )

    go_repository(
        name = "com_github_jinzhu_gorm",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/jinzhu/gorm",
        sum = "h1:0D5F4qAGJbRqzyCIHswU2fCwB1XGTDkBwBn9qncQYYs=",
        version = "v0.0.0-20170316141641-572d0a0ab1eb",
    )
    go_repository(
        name = "com_github_jinzhu_inflection",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/jinzhu/inflection",
        sum = "h1:LIwA5USOJ9W/0hwiRH1MugeThGBHGqv+USXcDKWHIVY=",
        version = "v0.0.0-20190603042836-f5c5f50e6090",
    )
    go_repository(
        name = "com_github_jinzhu_now",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/jinzhu/now",
        sum = "h1:HjfetcXq097iXP0uoPCdnM4Efp5/9MsM0/M+XOTeR3M=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_jmespath_go_jmespath",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/jmespath/go-jmespath",
        sum = "h1:pmfjZENx5imkbgOkpRUYLnmbU7UEFbjtDA2hxJ1ichM=",
        version = "v0.0.0-20180206201540-c2b33e8439af",
    )
    go_repository(
        name = "com_github_joho_godotenv",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/joho/godotenv",
        sum = "h1:Zjp+RcGpHhGlrMbJzXTrZZPrWj+1vfm90La1wgB6Bhc=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_jonboulle_clockwork",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/jonboulle/clockwork",
        sum = "h1:VKV+ZcuP6l3yW9doeqz6ziZGgcynBVQO+obU0+0hcPo=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_json_iterator_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/json-iterator/go",
        sum = "h1:KfgG9LzI+pYjr4xvmz/5H4FXjokeP+rlHLhv3iH62Fo=",
        version = "v1.1.7",
    )

    go_repository(
        name = "com_github_jstemmer_go_junit_report",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/jstemmer/go-junit-report",
        sum = "h1:rBMNdlhTLzJjJSDIjNEXX1Pz3Hmwmz91v+zycvx9PJc=",
        version = "v0.0.0-20190106144839-af01ea7f8024",
    )
    go_repository(
        name = "com_github_julienschmidt_httprouter",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/julienschmidt/httprouter",
        sum = "h1:TDTW5Yz1mjftljbcKqRcrYhd4XeOoI98t+9HbQbYf7g=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_kisielk_errcheck",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/kisielk/errcheck",
        sum = "h1:reN85Pxc5larApoH1keMBiu2GWtPqXQ1nc9gx+jOU+E=",
        version = "v1.2.0",
    )

    go_repository(
        name = "com_github_kisielk_gotool",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/kisielk/gotool",
        sum = "h1:AV2c/EiW3KqPNT9ZKl07ehoAGi4C5/01Cfbblndcapg=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_klauspost_compress",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/klauspost/compress",
        sum = "h1:8VMb5+0wMgdBykOV96DwNwKFQ+WTI4pzYURP99CcB9E=",
        version = "v1.4.1",
    )
    go_repository(
        name = "com_github_klauspost_cpuid",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/klauspost/cpuid",
        sum = "h1:vJi+O/nMdFt0vqm8NZBI6wzALWdA2X+egi0ogNyrC/w=",
        version = "v1.2.1",
    )
    go_repository(
        name = "com_github_klauspost_pgzip",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/klauspost/pgzip",
        sum = "h1:oIPZROsWuPHpOdMVWLuJZXwgjhrW8r1yEX8UqMyeNHM=",
        version = "v1.2.1",
    )
    go_repository(
        name = "com_github_knative_build",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/knative/build",
        sum = "h1:3KvuoUpgXYkK3WKaSBVN/0FSwRaukf212t2bQkMSWjY=",
        version = "v0.3.1-0.20190330033454-38ace00371c7",
    )

    go_repository(
        name = "com_github_knative_pkg",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/knative/pkg",
        sum = "h1:WE+sMoCzGTt6OhWGWkXwtuzmfqofaqfyx0i9qte+NLQ=",
        version = "v0.0.0-20190330034653-916205998db9",
    )
    go_repository(
        name = "com_github_konsorten_go_windows_terminal_sequences",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/konsorten/go-windows-terminal-sequences",
        sum = "h1:DB17ag19krx9CFsz4o3enTrPXyIXCl+2iCXH/aMAp9s=",
        version = "v1.0.2",
    )
    go_repository(
        name = "com_github_kr_logfmt",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/kr/logfmt",
        sum = "h1:T+h1c/A9Gawja4Y9mFVWj2vyii2bbUNDw3kt9VxK2EY=",
        version = "v0.0.0-20140226030751-b84e30acd515",
    )
    go_repository(
        name = "com_github_kr_pretty",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/kr/pretty",
        sum = "h1:L/CwN0zerZDmRFUapSPitk6f+Q3+0za1rQkzVuMiMFI=",
        version = "v0.1.0",
    )

    go_repository(
        name = "com_github_kr_pty",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/kr/pty",
        sum = "h1:VkoXIwSboBpnk99O/KFauAEILuNHv5DVFKZMBN/gUgw=",
        version = "v1.1.1",
    )

    go_repository(
        name = "com_github_kr_text",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/kr/text",
        sum = "h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=",
        version = "v0.1.0",
    )

    go_repository(
        name = "com_github_lib_pq",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/lib/pq",
        sum = "h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_magiconair_properties",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/magiconair/properties",
        sum = "h1:ZC2Vc7/ZFkGmsVC9KvOjumD+G5lXy2RtTKyzRKO2BQ4=",
        version = "v1.8.1",
    )
    go_repository(
        name = "com_github_mailru_easyjson",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mailru/easyjson",
        sum = "h1:TpvdAwDAt1K4ANVOfcihouRdvP+MgAfDWwBuct4l6ZY=",
        version = "v0.0.0-20160728113105-d5b7844b561a",
    )
    go_repository(
        name = "com_github_markbates_inflect",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/markbates/inflect",
        sum = "h1:5fh1gzTFhfae06u3hzHYO9xe3l3v3nW5Pwt3naLTP5g=",
        version = "v1.0.4",
    )
    go_repository(
        name = "com_github_masterminds_goutils",
        importpath = "github.com/Masterminds/goutils",
        sum = "h1:zukEsf/1JZwCMgHiK3GZftabmxiCw4apj3a28RPBiVg=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_masterminds_semver",
        importpath = "github.com/Masterminds/semver",
        sum = "h1:H65muMkzWKEuNDnfl9d70GUjFniHKHRbFPGBuZ3QEww=",
        version = "v1.5.0",
    )
    go_repository(
        name = "com_github_masterminds_sprig",
        importpath = "github.com/Masterminds/sprig",
        sum = "h1:z4yfnGrZ7netVz+0EDJ0Wi+5VZCSYp4Z0m2dk6cEM60=",
        version = "v2.22.0+incompatible",
    )

    go_repository(
        name = "com_github_mattbaird_jsonpatch",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mattbaird/jsonpatch",
        sum = "h1:uYuGXJBAi1umT+ZS4oQJUgKtfXCAYTR+n9zw1ViT0vA=",
        version = "v0.0.0-20200820163806-098863c1fc24",
    )
    go_repository(
        name = "com_github_mattn_go_colorable",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mattn/go-colorable",
        sum = "h1:UVL0vNpWh04HeJXV0KLcaT7r06gOH2l4OW6ddYRUIY4=",
        version = "v0.0.9",
    )
    go_repository(
        name = "com_github_mattn_go_isatty",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mattn/go-isatty",
        sum = "h1:bnP0vzxcAdeI1zdubAl5PjU6zsERjGZb7raWodagDYs=",
        version = "v0.0.4",
    )
    go_repository(
        name = "com_github_mattn_go_runewidth",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mattn/go-runewidth",
        sum = "h1:UnlwIPBGaTZfPQ6T1IGzPI0EkYAQmT9fAEJ/poFC63o=",
        version = "v0.0.2",
    )
    go_repository(
        name = "com_github_mattn_go_sqlite3",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mattn/go-sqlite3",
        sum = "h1:LeyN6zuPxHQrv7ZGHbo2Ymtj+BfpbG02+5iAgKds/zU=",
        version = "v0.0.0-20160514122348-38ee283dabf1",
    )
    go_repository(
        name = "com_github_mattn_go_zglob",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mattn/go-zglob",
        sum = "h1:xsEx/XUoVlI6yXjqBK062zYhRTZltCNmYPx6v+8DNaY=",
        version = "v0.0.1",
    )

    go_repository(
        name = "com_github_matttproud_golang_protobuf_extensions",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/matttproud/golang_protobuf_extensions",
        sum = "h1:4hp9jkHxhMHkqkrB3Ix0jegS5sx/RkqARlsWZ6pIwiU=",
        version = "v1.0.1",
    )

    go_repository(
        name = "com_github_mdempsky_maligned",
        commit = "6e39bd26a8c8",
        importpath = "github.com/mdempsky/maligned",
    )

    go_repository(
        name = "com_github_mdempsky_unconvert",
        commit = "2db5a8ead8e7",
        importpath = "github.com/mdempsky/unconvert",
    )

    go_repository(
        name = "com_github_mibk_dupl",
        importpath = "github.com/mibk/dupl",
        tag = "v1.0.0",
    )

    go_repository(
        name = "com_github_microsoft_go_winio",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/Microsoft/go-winio",
        sum = "h1:+hMXMk01us9KgxGb7ftKQt2Xpf5hH/yky+TDA+qxleU=",
        version = "v0.4.14",
    )
    go_repository(
        name = "com_github_mitchellh_copystructure",
        importpath = "github.com/mitchellh/copystructure",
        sum = "h1:Laisrj+bAB6b/yJwB5Bt3ITZhGJdqmxquMKeZ+mmkFQ=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_mitchellh_go_homedir",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mitchellh/go-homedir",
        sum = "h1:lukF9ziXFxDFPkA1vsr5zpc1XuPDn/wFntq5mG+4E0Y=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_mitchellh_ioprogress",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mitchellh/ioprogress",
        sum = "h1:Qa6dnn8DlasdXRnacluu8HzPts0S1I9zvvUPDbBnXFI=",
        version = "v0.0.0-20180201004757-6a23b12fa88e",
    )
    go_repository(
        name = "com_github_mitchellh_mapstructure",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mitchellh/mapstructure",
        sum = "h1:fmNYVwqnSfB9mZU6OS2O6GsXM+wcskZDuKQzvN1EDeE=",
        version = "v1.1.2",
    )
    go_repository(
        name = "com_github_mitchellh_reflectwalk",
        importpath = "github.com/mitchellh/reflectwalk",
        sum = "h1:9D+8oIskB4VJBN5SFlmc27fSlIBZaov1Wpk/IfikLNY=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_modern_go_concurrent",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/modern-go/concurrent",
        sum = "h1:TRLaZ9cD/w8PVh93nsPXa1VrQ6jlwL5oN8l14QlcNfg=",
        version = "v0.0.0-20180306012644-bacd9c7ef1dd",
    )

    go_repository(
        name = "com_github_modern_go_reflect2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/modern-go/reflect2",
        sum = "h1:9f412s+6RmYXLWZSEzVVgPGK7C2PphHj5RJrvfx9AWI=",
        version = "v1.0.1",
    )

    go_repository(
        name = "com_github_mozilla_tls_observatory",
        commit = "8791a200eb40",
        importpath = "github.com/mozilla/tls-observatory",
    )

    go_repository(
        name = "com_github_munnerz_goautoneg",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/munnerz/goautoneg",
        sum = "h1:7PxY7LVfSZm7PEeBTyK1rj1gABdCO2mbri6GKO1cMDs=",
        version = "v0.0.0-20120707110453-a547fc61f48d",
    )
    go_repository(
        name = "com_github_mwitkow_go_conntrack",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mwitkow/go-conntrack",
        sum = "h1:F9x/1yl3T2AeKLr2AMdilSD8+f9bvMnNN8VS5iDtovc=",
        version = "v0.0.0-20161129095857-cc309e4a2223",
    )

    go_repository(
        name = "com_github_mxk_go_flowrate",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/mxk/go-flowrate",
        sum = "h1:y5//uYreIhSUg3J1GEMiLbxo1LJaP8RfCpH6pymGZus=",
        version = "v0.0.0-20140419014527-cca7078d478f",
    )
    go_repository(
        name = "com_github_natefinch_lumberjack",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/natefinch/lumberjack",
        sum = "h1:4QJd3OLAMgj7ph+yZTuX13Ld4UpgHp07nNdFX7mqFfM=",
        version = "v2.0.0+incompatible",
    )
    go_repository(
        name = "com_github_nbutton23_zxcvbn_go",
        commit = "a22cb81b2ecd",
        importpath = "github.com/nbutton23/zxcvbn-go",
    )

    go_repository(
        name = "com_github_nytimes_gziphandler",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/NYTimes/gziphandler",
        sum = "h1:lsxEuwrXEAokXB9qhlbKWPpo3KMLZQ5WB5WLQRW1uq0=",
        version = "v0.0.0-20170623195520-56545f4a5d46",
    )
    go_repository(
        name = "com_github_olekukonko_tablewriter",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/olekukonko/tablewriter",
        sum = "h1:58+kh9C6jJVXYjt8IE48G2eWl6BjwU5Gj0gqY84fy78=",
        version = "v0.0.0-20170122224234-a0225b3f23b5",
    )
    go_repository(
        name = "com_github_onsi_ginkgo",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/onsi/ginkgo",
        sum = "h1:q/mM8GF/n0shIN8SaAZ0V+jnLPzen6WIVZdiwrRlMlo=",
        version = "v1.10.1",
    )

    go_repository(
        name = "com_github_onsi_gomega",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/onsi/gomega",
        sum = "h1:XPnZz8VVBHjVsy1vzJmRwIcSwiUO+JFfrv/xGiigmME=",
        version = "v1.7.0",
    )

    go_repository(
        name = "com_github_opencontainers_go_digest",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/opencontainers/go-digest",
        sum = "h1:WzifXhOVOEOuFYOJAW6aQqW0TooG2iki3E3Ii+WN7gQ=",
        version = "v1.0.0-rc1",
    )
    go_repository(
        name = "com_github_opencontainers_image_spec",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/opencontainers/image-spec",
        sum = "h1:JMemWkRwHx4Zj+fVxWoMCFm/8sYGGrUVojFA6h/TRcI=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_opennota_check",
        commit = "0c771f5545ff",
        importpath = "github.com/opennota/check",
    )

    go_repository(
        name = "com_github_openzipkin_zipkin_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/openzipkin/zipkin-go",
        sum = "h1:A/ADD6HaPnAKj3yS7HjGHRK77qi41Hi0DirOOIQAeIw=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_pborman_uuid",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/pborman/uuid",
        sum = "h1:J7Q5mO4ysT1dv8hyrUGHb9+ooztCXu1D8MY8DZYsu3g=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_pelletier_go_toml",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/pelletier/go-toml",
        sum = "h1:e5+lF2E4Y2WCIxBefVowBuB0iHrUH4HZ8q+6mGF7fJc=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_peterbourgon_diskv",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/peterbourgon/diskv",
        sum = "h1:UBdAOUP5p4RWqPBg048CAvpKN+vxiaj6gdUUzhl4XmI=",
        version = "v2.0.1+incompatible",
    )

    go_repository(
        name = "com_github_pierrec_lz4",
        importpath = "github.com/pierrec/lz4",
        sum = "h1:2xWsjqPFWcplujydGg4WmhC/6fZqK42wMM8aXeqhl0I=",
        version = "v2.0.5+incompatible",
    )
    go_repository(
        name = "com_github_pkg_errors",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/pkg/errors",
        sum = "h1:iURUrRGxPUNPdy5/HRSm+Yj6okJ6UtLINN0Q9M4+h3I=",
        version = "v0.8.1",
    )
    go_repository(
        name = "com_github_pmezard_go_difflib",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/pmezard/go-difflib",
        sum = "h1:4DBwDE0NGyQoBHbLQYPwSUPoCMWR5BEzIk/f1lZbAQM=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_pquerna_cachecontrol",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/pquerna/cachecontrol",
        sum = "h1:0XM1XL/OFFJjXsYXlG30spTkV/E9+gmd5GD1w2HE8xM=",
        version = "v0.0.0-20171018203845-0dec1b30a021",
    )
    go_repository(
        name = "com_github_prometheus_client_golang",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/prometheus/client_golang",
        sum = "h1:JnMpQc6ppsNgw9QPAGF6Dod479itz7lvlsMzzNayLOI=",
        version = "v1.2.1",
    )

    go_repository(
        name = "com_github_prometheus_client_model",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/prometheus/client_model",
        sum = "h1:gQz4mCbXsO+nc9n1hCxHcGA3Zx3Eo+UHZoInFGUIXNM=",
        version = "v0.0.0-20190812154241-14fe0d1b01d4",
    )

    go_repository(
        name = "com_github_prometheus_common",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/prometheus/common",
        sum = "h1:L+1lyG48J1zAQXA3RBX/nG/B3gjlHq0zTt2tlbJLyCY=",
        version = "v0.7.0",
    )

    go_repository(
        name = "com_github_prometheus_procfs",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/prometheus/procfs",
        sum = "h1:3+auTFlqw+ZaQYJARz6ArODtkaIwtvBTx3N2NehQlL8=",
        version = "v0.0.5",
    )

    go_repository(
        name = "com_github_puerkitobio_purell",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/PuerkitoBio/purell",
        sum = "h1:0GoNN3taZV6QI81IXgCbxMyEaJDXMSIjArYBCYzVVvs=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_puerkitobio_urlesc",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/PuerkitoBio/urlesc",
        sum = "h1:JCHLVE3B+kJde7bIEo5N4J+ZbLhp0J1Fs+ulyRws4gE=",
        version = "v0.0.0-20160726150825-5bd2802263f2",
    )
    go_repository(
        name = "com_github_rcrowley_go_metrics",
        importpath = "github.com/rcrowley/go-metrics",
        sum = "h1:9ZKAASQSHhDYGoxY8uLVpewe1GDZ2vu2Tr/vTdVAkFQ=",
        version = "v0.0.0-20181016184325-3113b8401b8a",
    )

    go_repository(
        name = "com_github_remyoudompheng_bigfft",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/remyoudompheng/bigfft",
        sum = "h1:/NRJ5vAYoqz+7sG51ubIDHXeWO8DlTSrToPu6q11ziA=",
        version = "v0.0.0-20170806203942-52369c62f446",
    )
    go_repository(
        name = "com_github_rogpeppe_go_internal",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/rogpeppe/go-internal",
        sum = "h1:XU784Pr0wdahMY2bYcyK6N1KuaRAdLtqD4qd8D18Bfs=",
        version = "v1.3.2",
    )

    go_repository(
        name = "com_github_russross_blackfriday",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/russross/blackfriday",
        sum = "h1:HyvC0ARfnZBqnXwABFeSZHpKvJHJJfPz81GNueLj0oo=",
        version = "v1.5.2",
    )
    go_repository(
        name = "com_github_ryanuber_go_glob",
        commit = "256dc444b735",
        importpath = "github.com/ryanuber/go-glob",
    )
    go_repository(
        name = "com_github_satori_go_uuid",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/satori/go.uuid",
        sum = "h1:1r/p6yT1FfHR1+qBm7UYBPgfqCmzz/8mpNvfc+iKlfU=",
        version = "v0.0.0-20160713180306-0aa62d5ddceb",
    )

    go_repository(
        name = "com_github_securego_gosec",
        commit = "a966ff760c3a",
        importpath = "github.com/securego/gosec",
    )

    go_repository(
        name = "com_github_shopify_sarama",
        importpath = "github.com/Shopify/sarama",
        sum = "h1:9oksLxC6uxVPHPVYUmq6xhr1BOF/hHobWH2UzO67z1s=",
        version = "v1.19.0",
    )
    go_repository(
        name = "com_github_shopify_toxiproxy",
        importpath = "github.com/Shopify/toxiproxy",
        sum = "h1:TKdv8HiTLgE5wdJuEML90aBgNWsokNbMijUGhmcoBJc=",
        version = "v2.1.4+incompatible",
    )
    go_repository(
        name = "com_github_shurcool_githubv4",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/shurcooL/githubv4",
        sum = "h1:cppRIvEpuZcSdhbhyJZ/3ThCPYlx6xuZg8Qid/0+bz0=",
        version = "v0.0.0-20180925043049-51d7b505e2e9",
    )

    go_repository(
        name = "com_github_shurcool_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/shurcooL/go",
        sum = "h1:MZM7FHLqUHYI0Y/mQAt3d2aYa0SiNms/hFqC9qJYolM=",
        version = "v0.0.0-20180423040247-9e1955d9fb6e",
    )

    go_repository(
        name = "com_github_shurcool_graphql",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/shurcooL/graphql",
        sum = "h1:YIoQLhvoRcfiL0pyxqkESFZXa7jQrcfLTUSSUeyYMO8=",
        version = "v0.0.0-20180924043259-e4a3a37e6d42",
    )

    go_repository(
        name = "com_github_sirupsen_logrus",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/sirupsen/logrus",
        sum = "h1:SPIRibHv4MatM3XXNO2BJeFLZwZ2LvZgfQ5+UNI2im4=",
        version = "v1.4.2",
    )

    go_repository(
        name = "com_github_soheilhy_cmux",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/soheilhy/cmux",
        sum = "h1:0HKaf1o97UwFjHH9o5XsHUOF+tqmdA7KEzXLpiyaw0E=",
        version = "v0.1.4",
    )
    go_repository(
        name = "com_github_spf13_afero",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/spf13/afero",
        sum = "h1:5jhuqJyZCZf2JRofRvN/nIFgIWNzPa3/Vz8mYylgbWc=",
        version = "v1.2.2",
    )
    go_repository(
        name = "com_github_spf13_cast",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/spf13/cast",
        sum = "h1:oget//CVOEoFewqQxwr0Ej5yjygnqGkvggSE/gB35Q8=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_spf13_cobra",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/spf13/cobra",
        sum = "h1:f0B+LkLX6DtmRH1isoNA9VTtNUK9K8xYd28JNNfOv/s=",
        version = "v0.0.5",
    )
    go_repository(
        name = "com_github_spf13_jwalterweatherman",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/spf13/jwalterweatherman",
        sum = "h1:XHEdyB+EcvlqZamSM4ZOMGlc93t6AcsBEu9Gc1vn7yk=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_spf13_pflag",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/spf13/pflag",
        sum = "h1:zPAT6CGy6wXeQ7NtTnaTerfKOsV6V6F8agHXFiazDkg=",
        version = "v1.0.3",
    )

    go_repository(
        name = "com_github_spf13_viper",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/spf13/viper",
        sum = "h1:VUFqw5KcqRf7i70GOzW7N+Q7+gxVBkSSqiXB12+JQ4M=",
        version = "v1.3.2",
    )
    go_repository(
        name = "com_github_stretchr_objx",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/stretchr/objx",
        sum = "h1:4G4v2dO3VZwixGIRoQ5Lfboy6nUhCyYzaqnIAPPhYs4=",
        version = "v0.1.0",
    )

    go_repository(
        name = "com_github_stretchr_testify",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/stretchr/testify",
        sum = "h1:TivCn/peBQ7UY8ooIcPgZFpTNSz0Q2U6UrFlUfqbe0Q=",
        version = "v1.3.0",
    )

    go_repository(
        name = "com_github_stripe_safesql",
        commit = "cddf355596fe",
        importpath = "github.com/stripe/safesql",
    )

    go_repository(
        name = "com_github_tektoncd_pipeline",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/tektoncd/pipeline",
        sum = "h1:qxPdNf3noTDiB1IhLJk5MK7giWPk36oXF6LObILlbIk=",
        version = "v0.1.1-0.20190327171839-7c43fbae2816",
    )
    go_repository(
        name = "com_github_tmc_grpc_websocket_proxy",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/tmc/grpc-websocket-proxy",
        sum = "h1:ndzgwNDnKIqyCvHTXaCqh9KlOWKvBry6nuXMJmonVsE=",
        version = "v0.0.0-20170815181823-89b8d40f7ca8",
    )
    go_repository(
        name = "com_github_tsenart_deadcode",
        commit = "210d2dc333e9",
        importpath = "github.com/tsenart/deadcode",
    )

    go_repository(
        name = "com_github_ugorji_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/ugorji/go",
        sum = "h1:gmervu+jDMvXTbcHQ0pd2wee85nEoE0BsVyEuzkfK8w=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_ugorji_go_codec",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/ugorji/go/codec",
        sum = "h1:3SVOIvH7Ae1KRYyQWRjXWJEA9sS/c/pjvH++55Gr648=",
        version = "v0.0.0-20181204163529-d75b2dcb6bc8",
    )
    go_repository(
        name = "com_github_urfave_cli",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/urfave/cli",
        sum = "h1:m9MfmZWX7bwr9kUcs/Asr95j0IVXzGNNc+/5ku2m26Q=",
        version = "v1.18.0",
    )
    go_repository(
        name = "com_github_walle_lll",
        commit = "8b13b3fbf731",
        importpath = "github.com/walle/lll",
    )

    go_repository(
        name = "com_github_xiang90_probing",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/xiang90/probing",
        sum = "h1:MPPkRncZLN9Kh4MEFmbnK4h3BD7AUmskWv2+EeZJCCs=",
        version = "v0.0.0-20160813154853-07dd2e8dfe18",
    )
    go_repository(
        name = "com_github_xlab_handysort",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/xlab/handysort",
        sum = "h1:j2hhcujLRHAg872RWAV5yaUrEjHEObwDv3aImCaNLek=",
        version = "v0.0.0-20150421192137-fb3537ed64a1",
    )
    go_repository(
        name = "com_github_xordataexchange_crypt",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "github.com/xordataexchange/crypt",
        sum = "h1:ESFSdwYZvkeru3RtdrYueztKhOBCSAAzS4Gf+k0tEow=",
        version = "v0.0.3-0.20170626215501-b2862e3d0a77",
    )
    go_repository(
        name = "com_google_cloud_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "cloud.google.com/go",
        sum = "h1:ROfEUZz+Gh5pa62DJWXSaonyu3StP6EA6lPEXPI6mCo=",
        version = "v0.38.0",
    )

    go_repository(
        name = "com_google_cloud_go_bigquery",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "cloud.google.com/go/bigquery",
        sum = "h1:hL+ycaJpVE9M7nLoiXb/Pn10ENE2u+oddxbD8uu0ZVU=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_google_cloud_go_datastore",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "cloud.google.com/go/datastore",
        sum = "h1:Kt+gOPPp2LEPWp8CSfxhsM8ik9CcyE/gYu+0r+RnZvM=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_google_cloud_go_pubsub",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "cloud.google.com/go/pubsub",
        sum = "h1:W9tAK3E57P75u0XLLR82LZyw8VpAnhmyTOxW9qzmyj8=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_google_cloud_go_storage",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "cloud.google.com/go/storage",
        sum = "h1:q7KNypEb3CARnitCAqY63g+dZp9HDEgv/c6IPlPLMJI=",
        version = "v1.1.2",
    )
    go_repository(
        name = "com_shuralyov_dmitri_gpu_mtl",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "dmitri.shuralyov.com/gpu/mtl",
        sum = "h1:VpgP7xuJadIUuKccphEpTJnWhS2jkQyMt6Y7pJCD7fY=",
        version = "v0.0.0-20190408044501-666a987793e9",
    )
    go_repository(
        name = "in_gopkg_airbrake_gobrake_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/airbrake/gobrake.v2",
        sum = "h1:7z2uVWwn7oVeeugY1DtlPAy5H+KYgB1KeKTnqjNatLo=",
        version = "v2.0.9",
    )

    go_repository(
        name = "in_gopkg_alecthomas_kingpin_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/alecthomas/kingpin.v2",
        sum = "h1:jMFz6MfLP0/4fUyZle81rXUoxOBFi19VUFKVDOQfozc=",
        version = "v2.2.6",
    )
    go_repository(
        name = "in_gopkg_check_v1",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/check.v1",
        sum = "h1:qIbj1fsPNlZgppZ+VLlY7N33q108Sa+fhmuc+sWQYwY=",
        version = "v1.0.0-20180628173108-788fd7840127",
    )

    go_repository(
        name = "in_gopkg_cheggaaa_pb_v1",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/cheggaaa/pb.v1",
        sum = "h1:Ev7yu1/f6+d+b3pi5vPdRPc6nNtP1umSfcWiEfRqv6I=",
        version = "v1.0.25",
    )
    go_repository(
        name = "in_gopkg_errgo_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/errgo.v2",
        sum = "h1:0vLT13EuvQ0hNvakwLuFZ/jYrLp5F3kcWHXdRggjCE8=",
        version = "v2.1.0",
    )
    go_repository(
        name = "in_gopkg_fsnotify_v1",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/fsnotify.v1",
        sum = "h1:xOHLXZwVvI9hhs+cLKq5+I5onOuwQLhQwiu63xxlHs4=",
        version = "v1.4.7",
    )

    go_repository(
        name = "in_gopkg_gemnasium_logrus_airbrake_hook_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/gemnasium/logrus-airbrake-hook.v2",
        sum = "h1:OAj3g0cR6Dx/R07QgQe8wkA9RNjB2u4i700xBkIT4e0=",
        version = "v2.1.2",
    )

    go_repository(
        name = "in_gopkg_inf_v0",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/inf.v0",
        sum = "h1:3zYtXIO92bvsdS3ggAdA8Gb4Azj0YU+TVY1uGYNFA8o=",
        version = "v0.9.0",
    )

    go_repository(
        name = "in_gopkg_natefinch_lumberjack_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/natefinch/lumberjack.v2",
        sum = "h1:986b60BAz5vO2Vaf48yQaq+wb2bU4JsXxKu1+itW6x8=",
        version = "v2.0.0-20150622162204-20b71e5b60d7",
    )
    go_repository(
        name = "in_gopkg_robfig_cron_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/robfig/cron.v2",
        sum = "h1:E846t8CnR+lv5nE+VuiKTDG/v1U2stad0QzddfJC7kY=",
        version = "v2.0.0-20150107220207-be2e0b0deed5",
    )

    go_repository(
        name = "in_gopkg_square_go_jose_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/square/go-jose.v2",
        sum = "h1:ELQJ5WuT+ydETLCpWvAuw8iGBQRGoJq+A3RAbbAcZUY=",
        version = "v2.0.0-20180411045311-89060dee6a84",
    )
    go_repository(
        name = "in_gopkg_tomb_v1",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/tomb.v1",
        sum = "h1:uRGJdciOHaEIrze2W8Q3AKkepLTh2hOroT7a+7czfdQ=",
        version = "v1.0.0-20141024135613-dd632973f1e7",
    )

    go_repository(
        name = "in_gopkg_yaml_v1",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/yaml.v1",
        sum = "h1:POO/ycCATvegFmVuPpQzZFJ+pGZeX22Ufu6fibxDVjU=",
        version = "v1.0.0-20140924161607-9f9df34309c0",
    )
    go_repository(
        name = "in_gopkg_yaml_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/yaml.v2",
        sum = "h1:/eiJrUcujPVeJ3xlSWaiNi3uSVmDGBK1pDHUHAnao1I=",
        version = "v2.2.4",
    )

    go_repository(
        name = "in_gopkg_yaml_v3",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gopkg.in/yaml.v3",
        sum = "h1:0efs3hwEZhFKsCoP8l6dDB1AZWMgnEl3yWXWRZTOaEA=",
        version = "v3.0.0-20190709130402-674ba3eaed22",
    )
    go_repository(
        name = "io_etcd_go_bbolt",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "go.etcd.io/bbolt",
        sum = "h1:M0l89sIuZ+RkW0rLbUsmxescVzLwLUs+Kvks+0jeHdM=",
        version = "v1.3.1-etcd.7",
    )
    go_repository(
        name = "io_etcd_go_etcd",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "go.etcd.io/etcd",
        sum = "h1:eBTQSvESFeaCGhot+9ieBlsaWyKPcJCGF/WSa+Vbrw8=",
        version = "v0.0.0-20181031231232-83304cfc808c",
    )
    go_repository(
        name = "io_k8s_api",
        build_file_generation = "on",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/api",
        sum = "h1:j1mSRwavnCC3Q5QpgH0ldhap5qeCnRuf7xl0l1VUzdM=",
        version = "v0.0.0-20191005115622-2e41325d9e4b",
    )

    go_repository(
        name = "io_k8s_apiextensions_apiserver",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/apiextensions-apiserver",
        sum = "h1:Kl/sh+wWzYK2hWFZtwvuFECup1SbE2kXfMnhGZsoO5M=",
        version = "v0.0.0-20190918201827-3de75813f604",
    )

    go_repository(
        name = "io_k8s_apimachinery",
        build_file_generation = "on",
        build_file_name = "BUILD.bazel",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/apimachinery",
        sum = "h1:arf6Ha+cae2UQsu4JW0KNMhXRDYzV4Il6NnTI/0npUc=",
        version = "v0.0.0-20191006235458-f9f2f3f8ab02",
    )

    go_repository(
        name = "io_k8s_apiserver",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/apiserver",
        sum = "h1:vXeVIqZsVgwfUENTAeybgfNVW7zZD7GPZJGtwReK+hI=",
        version = "v0.0.0-20190918200908-1e17798da8c1",
    )
    go_repository(
        name = "io_k8s_client_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/client-go",
        sum = "h1:7KILztrOx+9yROaqEgvDvtAuiFHMjUBOXg77flds6Es=",
        version = "v0.0.0-20191008115822-1210218b4a26",
    )

    go_repository(
        name = "io_k8s_code_generator",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/code-generator",
        sum = "h1:5ThSMjYOj3BFKSGhu4ol8ZdkuChW+dc33TyvySWbTTw=",
        version = "v0.0.0-20190831074504-732c9ca86353",
    )

    go_repository(
        name = "io_k8s_component_base",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/component-base",
        sum = "h1:YicOHTLJZz/TIpJcqhVYJI2LyuM7VMkYiiG6FZfJmzY=",
        version = "v0.0.0-20190918200425-ed2f0867c778",
    )
    go_repository(
        name = "io_k8s_gengo",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/gengo",
        sum = "h1:4s3/R4+OYYYUKptXPhZKjQ04WJ6EhQQVFdjOFvCazDk=",
        version = "v0.0.0-20190128074634-0689ccc1d7d6",
    )
    go_repository(
        name = "io_k8s_klog",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/klog",
        sum = "h1:Pt+yjF5aB1xDSVbau4VsWe+dQNzA0qv1LlXdC2dF6Q8=",
        version = "v1.0.0",
    )

    go_repository(
        name = "io_k8s_kube_openapi",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/kube-openapi",
        sum = "h1:EYm5AW/UUDbnmnI+gK0TJDVK9qPLhM+sRHYanNKw0EQ=",
        version = "v0.0.0-20190816220812-743ec37842bf",
    )
    go_repository(
        name = "io_k8s_kubernetes",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/kubernetes",
        sum = "h1:wJx/r2HuPVaaBeCUk/P47GSK0eyrj3mI/kESRFBp6/A=",
        version = "v1.14.7",
    )
    go_repository(
        name = "io_k8s_repo_infra",
        importpath = "k8s.io/repo-infra",
        sum = "h1:PQyAIB6SRdV0a3Vj/VA39L1uANW36k/zg3tOk/Ffh3U=",
        version = "v0.0.0-20190329054012-df02ded38f95",
    )
    go_repository(
        name = "io_k8s_sigs_controller_runtime",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "sigs.k8s.io/controller-runtime",
        sum = "h1:ZtdgqJXVHsIytjdmDuk0QjagnzyLq9FjojXRqIp+dU4=",
        version = "v0.3.0",
    )

    go_repository(
        name = "io_k8s_sigs_structured_merge_diff",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "sigs.k8s.io/structured-merge-diff",
        sum = "h1:4Z09Hglb792X0kfOBBJUPFEyvVfQWrYT/l8h5EKA6JQ=",
        version = "v0.0.0-20190525122527-15d366b2352e",
    )
    go_repository(
        name = "io_k8s_sigs_testing_frameworks",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "sigs.k8s.io/testing_frameworks",
        sum = "h1:cP2l8fkA3O9vekpy5Ks8mmA0NW/F7yBdXf8brkWhVrs=",
        version = "v0.1.1",
    )
    go_repository(
        name = "io_k8s_sigs_yaml",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "sigs.k8s.io/yaml",
        sum = "h1:4A07+ZFc2wgJwo8YNlQpr1rVlgUDlxXHhPJciaPY5gs=",
        version = "v1.1.0",
    )

    go_repository(
        name = "io_k8s_test_infra",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/test-infra",
        sum = "h1:J/nTZ/pg1zz6bx923NafH3gb+Fr7RJKAuOoeKey/xWM=",
        version = "v0.0.0-20191025015832-1849ddeb80fc",
    )

    go_repository(
        name = "io_k8s_utils",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "k8s.io/utils",
        sum = "h1:rfepARh/ECp66dk9TTmT//1PBkHffjnxhdOrgH4m+eA=",
        version = "v0.0.0-20190920012459-5008bf6f8cd6",
    )
    go_repository(
        name = "io_opencensus_go",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "go.opencensus.io",
        sum = "h1:mU6zScU4U1YAFPHEHYk+3JC4SY7JxgkqS10ZOSyksNg=",
        version = "v0.21.0",
    )

    go_repository(
        name = "io_rsc_binaryregexp",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "rsc.io/binaryregexp",
        sum = "h1:HfqmD5MEmC0zvwBuF187nq9mdnXjXsSivRiXN7SmRkE=",
        version = "v0.2.0",
    )
    go_repository(
        name = "ml_vbom_util",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "vbom.ml/util",
        sum = "h1:O69FD9pJA4WUZlEwYatBEEkRWKQ5cKodWpdKTrCS/iQ=",
        version = "v0.0.0-20180919145318-efcd4e0f9787",
    )

    go_repository(
        name = "org_apache_git_thrift_git",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "git.apache.org/thrift.git",
        sum = "h1:OR8VhtwhcAI3U48/rzBsVOuHi0zDPzYI1xASVcdSgR8=",
        version = "v0.0.0-20180902110319-2566ecd5d999",
    )
    go_repository(
        name = "org_golang_google_api",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "google.golang.org/api",
        sum = "h1:KKgc1aqhV8wDPbDzlDtpvyjZFY3vjz85FP7p4wcQUyI=",
        version = "v0.4.0",
    )

    go_repository(
        name = "org_golang_google_appengine",
        build_file_generation = "on",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/appengine",
        sum = "h1:KxkO13IPW4Lslp2bz+KHP2E3gtFlrIGNThxkZQ3g+4c=",
        version = "v1.5.0",
    )

    go_repository(
        name = "org_golang_google_genproto",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "google.golang.org/genproto",
        sum = "h1:ZUjXAXmrAyrmmCPHgCA/vChHcpsX27MZ3yBonD/z1KE=",
        version = "v0.0.0-20190418145605-e7d98fc518a7",
    )

    go_repository(
        name = "org_golang_google_grpc",
        build_file_generation = "on",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/grpc",
        sum = "h1:cfg4PD8YEdSFnm7qLV4++93WcmhH2nIUhMjhdCvl3j8=",
        version = "v1.19.0",
    )

    go_repository(
        name = "org_golang_x_build",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/build",
        sum = "h1:Hgyq56/B1VbKi6tNXTJq3eo63zJbRzQr4uBZqiciilA=",
        version = "v0.0.0-20171220025321-125f04e1fc4b",
    )
    go_repository(
        name = "org_golang_x_crypto",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/crypto",
        sum = "h1:HuIa8hRrWRSrqYzx1qI49NNxhdi2PrY7gxVSq1JjLDc=",
        version = "v0.0.0-20190701094942-4def268fd1a4",
    )

    go_repository(
        name = "org_golang_x_exp",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/exp",
        sum = "h1:c2HOrn5iMezYjSlGPncknSEr/8x5LELb/ilJbXi9DEA=",
        version = "v0.0.0-20190121172915-509febef88a4",
    )

    go_repository(
        name = "org_golang_x_image",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/image",
        sum = "h1:+qEpEAPhDZ1o0x3tHzZTQDArnOixOzGD9HUJfcg0mb4=",
        version = "v0.0.0-20190802002840-cff245a6509b",
    )
    go_repository(
        name = "org_golang_x_lint",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/lint",
        sum = "h1:hX65Cu3JDlGH3uEdK7I99Ii+9kjD6mvnnpfLdEAH0x4=",
        version = "v0.0.0-20190301231843-5614ed5bae6f",
    )

    go_repository(
        name = "org_golang_x_mobile",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/mobile",
        sum = "h1:4+4C/Iv2U4fMZBiMCc98MG1In4gJY5YRhtpDNeDeHWs=",
        version = "v0.0.0-20190719004257-d2bd2a29d028",
    )

    go_repository(
        name = "org_golang_x_mod",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/mod",
        sum = "h1:sfUMP1Gu8qASkorDVjnMuvgJzwFbTZSeXFiGBYAVdl4=",
        version = "v0.1.0",
    )
    go_repository(
        name = "org_golang_x_net",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/net",
        sum = "h1:gkKoSkUmnU6bpS/VhkuO27bzQeSA51uaEfbOW5dNb68=",
        version = "v0.0.0-20190812203447-cdfb69ac37fc",
    )

    go_repository(
        name = "org_golang_x_oauth2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/oauth2",
        sum = "h1:SVwTIAaPC2U/AvvLNZ2a7OVsmBpC8L5BlwK1whH3hm0=",
        version = "v0.0.0-20190604053449-0f29369cfe45",
    )

    go_repository(
        name = "org_golang_x_sync",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/sync",
        sum = "h1:bjcUS9ztw9kFmmIxJInhon/0Is3p+EHBKNgquIzo1OI=",
        version = "v0.0.0-20190227155943-e225da77a7e6",
    )

    go_repository(
        name = "org_golang_x_sys",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/sys",
        sum = "h1:25KHgbfyiSm6vwQLbM3zZIe1v9p/3ea4Rz+nnM5K/i4=",
        version = "v0.0.0-20190616124812-15dcb6c0061f",
    )

    go_repository(
        name = "org_golang_x_text",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/text",
        sum = "h1:tW2bmiBqwgJj/UpqtC8EpXEZVYOwU0yG4iWbprSVAcs=",
        version = "v0.3.2",
    )

    go_repository(
        name = "org_golang_x_time",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/time",
        sum = "h1:SvFZT6jyqRaOeXpc5h/JSfZenJ2O330aBsf7JfSUXmQ=",
        version = "v0.0.0-20190308202827-9d24e82272b4",
    )

    go_repository(
        name = "org_golang_x_tools",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/tools",
        sum = "h1:H3uGjxCR/6Ds0Mjgyp7LMK81+LvmbvWWEnJhzk1Pi9E=",
        version = "v0.0.0-20190312170243-e65039ee4138",
    )

    go_repository(
        name = "org_golang_x_xerrors",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "golang.org/x/xerrors",
        sum = "h1:9zdDQZ7Thm29KFXgAX/+yaf3eVbP7djjWp/dXAppNCc=",
        version = "v0.0.0-20190717185122-a985d3407aa7",
    )
    go_repository(
        name = "org_gonum_v1_gonum",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gonum.org/v1/gonum",
        sum = "h1:OB/uP/Puiu5vS5QMRPrXCDWUPb+kt8f1KW8oQzFejQw=",
        version = "v0.0.0-20190331200053-3d26580ed485",
    )
    go_repository(
        name = "org_gonum_v1_netlib",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gonum.org/v1/netlib",
        sum = "h1:jRyg0XfpwWlhEV8mDfdNGBeSJM2fuyh9Yjrnd8kF2Ts=",
        version = "v0.0.0-20190331212654-76723241ea4e",
    )
    go_repository(
        name = "org_modernc_cc",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "modernc.org/cc",
        sum = "h1:nPibNuDEx6tvYrUAtvDTTw98rx5juGsa5zuDnKwEEQQ=",
        version = "v1.0.0",
    )
    go_repository(
        name = "org_modernc_golex",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "modernc.org/golex",
        sum = "h1:wWpDlbK8ejRfSyi0frMyhilD3JBvtcx2AdGDnU+JtsE=",
        version = "v1.0.0",
    )
    go_repository(
        name = "org_modernc_mathutil",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "modernc.org/mathutil",
        sum = "h1:93vKjrJopTPrtTNpZ8XIovER7iCIH1QU7wNbOQXC60I=",
        version = "v1.0.0",
    )
    go_repository(
        name = "org_modernc_strutil",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "modernc.org/strutil",
        sum = "h1:XVFtQwFVwc02Wk+0L/Z/zDDXO81r5Lhe6iMKmGX3KhE=",
        version = "v1.0.0",
    )
    go_repository(
        name = "org_modernc_xc",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "modernc.org/xc",
        sum = "h1:7ccXrupWZIS3twbUGrtKmHS2DXY6xegFua+6O3xgAFU=",
        version = "v1.0.0",
    )
    go_repository(
        name = "org_uber_go_atomic",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "go.uber.org/atomic",
        sum = "h1:2Oa65PReHzfn29GpvgsYwloV9AVFHPDk8tYxt2c2tr4=",
        version = "v1.3.2",
    )
    go_repository(
        name = "org_uber_go_multierr",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "go.uber.org/multierr",
        sum = "h1:HoEmRHQPVSqub6w2z2d2EOVs2fjyFRGyofhKuyDq0QI=",
        version = "v1.1.0",
    )
    go_repository(
        name = "org_uber_go_zap",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "go.uber.org/zap",
        sum = "h1:XCJQEf3W6eZaVwhRBof6ImoYGJSITeKWsyeh3HFu/5o=",
        version = "v1.9.1",
    )

    go_repository(
        name = "tools_gotest",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gotest.tools",
        sum = "h1:VsBPFP1AI068pPrMxtb/S8Zkgf9xEmTLJjfM+P5UIEo=",
        version = "v2.2.0+incompatible",
    )
    go_repository(
        name = "xyz_gomodules_jsonpatch_v2",
        build_file_generation = "on",
        build_file_proto_mode = "disable",
        importpath = "gomodules.xyz/jsonpatch/v2",
        sum = "h1:xyiBuvkD2g5n7cYzx6u2sxQvsAy4QJsZFCzGVdzOXZ0=",
        version = "v2.0.1",
    )
