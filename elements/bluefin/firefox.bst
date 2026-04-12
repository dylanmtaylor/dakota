kind: manual

sources:
- kind: tar
  (?):
  - arch == "x86_64":
      url: mozilla:firefox/releases/149.0.2/linux-x86_64/en-US/firefox-149.0.2.tar.xz
      ref: 814e872b969a4a33b6d44d27a2ab2f4b2c81692560cadb5855c0a3ae269e20e8
  - arch == "aarch64":
      url: mozilla:firefox/releases/149.0.2/linux-aarch64/en-US/firefox-149.0.2.tar.xz
      ref: b6c4c861dcb3ccaadadb77959f7de028f8543ecd8bc6a0b9f420752cf07c47b2

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/opt/firefox"
    cp -a . "%{install-root}/opt/firefox/"
  - |
    install -dm755 "%{install-root}%{bindir}"
    ln -sf /opt/firefox/firefox "%{install-root}%{bindir}/firefox"
  - |
    install -Dm644 /dev/stdin "%{install-root}%{datadir}/applications/firefox.desktop" <<'DESKTOP'
    [Desktop Entry]
    Name=Firefox
    Comment=Browse the World Wide Web
    GenericName=Web Browser
    Exec=firefox %u
    Terminal=false
    Type=Application
    Icon=firefox
    Categories=Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
    StartupNotify=true
    StartupWMClass=firefox
    DESKTOP
  - |
    for size in 16 32 48 64 128; do
      install -Dm644 "browser/chrome/icons/default/default${size}.png" \
          "%{install-root}%{datadir}/icons/hicolor/${size}x${size}/apps/firefox.png"
    done
  - |
    %{install-extra}
