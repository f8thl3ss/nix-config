{ pkgs, ... }:
{
  imports = [
    ./dconf.nix
  ];
  home.packages = with pkgs; [

    _1password-gui
    appimage-run
    bottom
    cinny-desktop
    distrobox
    emote
    firefox
    gnome.gnome-boxes
    google-chrome
    imagemagick
    inkscape
    lm_sensors
    nextcloud-client
    powertop
    prusa-slicer
    steam
    steam-run
    tailscale
    thunderbird
    timeshift
    toolbox
    vlc
    watchmate
    winetricks
    wineWowPackages.waylandFull
    wireguard-tools
    wl-clipboard
    xsel # clipboard support (also for neovim)

    # fly.io
    flyctl

    # Rust
    vscode-extensions.vadimcn.vscode-lldb

    # Code
    vscode.fhs
  ];
}
