kind: manual

sources:
- kind: tar
  url: github_files:Homebrew/brew/archive/refs/tags/5.1.4.tar.gz
  ref: 88780bf177254854d8b748d66a5e637d4342aad46e0c5ec594d5df1381c658f4

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/zstd.bst
- freedesktop-sdk.bst:components/tar.bst

runtime-depends:
- bluefin/brew.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    BREW_PREFIX="home/linuxbrew/.linuxbrew"
    BREW_REPO="${BREW_PREFIX}/Homebrew"

    mkdir -p "%{install-root}/${BREW_REPO}"
    cp -a . "%{install-root}/${BREW_REPO}/"

    for dir in bin etc include lib opt sbin share var Cellar Caskroom Frameworks; do
      mkdir -p "%{install-root}/${BREW_PREFIX}/${dir}"
    done

    ln -sf ../Homebrew/bin/brew "%{install-root}/${BREW_PREFIX}/bin/brew"

    mkdir -p "%{install-root}%{datadir}"
    tar --zstd -cf "%{install-root}%{datadir}/homebrew.tar.zst" -C "%{install-root}" home

    rm -rf "%{install-root}/home"
