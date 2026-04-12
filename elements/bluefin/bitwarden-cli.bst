kind: manual

sources:
- kind: zip
  base-dir: ""
  (?):
  - arch == "x86_64":
      url: github_files:bitwarden/clients/releases/download/cli-v2026.3.0/bw-linux-2026.3.0.zip
      ref: 0bdf85cfa1ad1e3c4f6cd2ae23d0de1af136939405f1f395b6836b7f43479ed2
  - arch == "aarch64":
      url: github_files:bitwarden/clients/releases/download/cli-v2026.3.0/bw-linux-arm64-2026.3.0.zip
      ref: 5826f3c4f0c5ff16151c9dccf0a8b245224b943a86c51f1125070bcdcaec1436

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" bw
  - |
    %{install-extra}
