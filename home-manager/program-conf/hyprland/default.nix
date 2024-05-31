{ pkgs, inputs, ... }:
{
  imports = [
    ./wofi.nix
    ./config.nix
    # inputs.hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    bluez
    bluez-tools
    brightnessctl
    dunst
    glib
    grim
    hyprpicker
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    playerctl
    pamixer
    slurp
    wayland
    wf-recorder
    wl-clip-persist
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    plugins = [
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };
}
