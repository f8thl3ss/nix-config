{ pkgs, inputs, ... }:
{
  # imports = [
  #   ./dconf.nix
  # ];
  home.packages = with pkgs; [
    # miseLatest

    # _1password
    # _1password-gui
    appimage-run
    bottom
    distrobox
    emote
    file
    firefox
    google-chrome
    imagemagick
    inkscape
    libreoffice
    lm_sensors
    nextcloud-client
    powertop
    prusa-slicer
    steam
    steam-run
    tailscale
    transmission_4
    thunderbird
    timeshift
    toolbox
    vlc
    # watchmate
    winetricks
    wineWowPackages.waylandFull
    wireguard-tools
    wl-clipboard
    xsel # clipboard support (also for neovim)
    inputs.zen-browser.packages."${system}".specific

    lima

    # fly.io
    flyctl

    # Editors
    zed-editor

    # Rust
    vscode-extensions.vadimcn.vscode-lldb

    # Secu
    rustscan
    # Code
    # vscode.fhs
  ];
}
