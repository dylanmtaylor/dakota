kind: manual

sources:
- kind: tar
  (?):
  - arch == "x86_64":
      url: github_files:bitwarden/clients/releases/download/desktop-v2026.3.1/bitwarden_2026.3.1_x64.tar.gz
      ref: 3558e24b829d90c7bb73ce22962f6fac1a9483b6052c1ed3075663413ec6efab
  - arch == "aarch64":
      url: github_files:bitwarden/clients/releases/download/desktop-v2026.3.1/bitwarden_2026.3.1_arm64.tar.gz
      ref: d0ad123773c8816f1125f0fd15b43c6732ad0d04c873b7d69e3f9bdcfcfc7ecc

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/opt/Bitwarden"
    cp -a . "%{install-root}/opt/Bitwarden/"
  - |
    install -dm755 "%{install-root}%{bindir}"
    ln -sf /opt/Bitwarden/bitwarden "%{install-root}%{bindir}/bitwarden"
  - |
    install -Dm644 resources/com.bitwarden.desktop.desktop \
        "%{install-root}%{datadir}/applications/com.bitwarden.desktop.desktop"
  - |
    for size in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
      install -Dm644 "resources/icons/${size}.png" \
          "%{install-root}%{datadir}/icons/hicolor/${size}/apps/com.bitwarden.desktop.png"
    done
  - |
    chmod 4755 "%{install-root}/opt/Bitwarden/chrome-sandbox"
  - |
    %{install-extra}
