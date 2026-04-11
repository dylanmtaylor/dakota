kind: manual

sources:
- kind: remote
  (?):
  - arch == "x86_64":
      url: github_files:ublue-os/brew/releases/download/5.1.5/homebrew-x86_64.tar.zst
      ref: 0000000000000000000000000000000000000000000000000000000000000000
  - arch == "aarch64":
      url: github_files:ublue-os/brew/releases/download/5.1.5/homebrew-aarch64.tar.zst
      ref: 0000000000000000000000000000000000000000000000000000000000000000

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

runtime-depends:
- bluefin/brew.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{datadir}"
    mv homebrew-%{arch}.tar.zst "%{install-root}%{datadir}/homebrew.tar.zst"
  - |
    %{install-extra}
