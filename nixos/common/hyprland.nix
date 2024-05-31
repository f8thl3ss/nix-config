{ pkgs, inputs, ... }:
{
  security = {
    polkit.enable = true;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  hardware = {
    opengl.enable = true;
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on bootrue;
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WAYLAND = "1";
  };
  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
    libnotify
    pavucontrol
    swaybg
    inputs.swww.packages.${pkgs.system}.swww
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
    xdgOpenUsePortal = true;
    wlr.enable = true;
  };
  services = {
    mpd.enable = true;

    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-sddm-corners";
      wayland = {
        enable = true;
      };
    };

    power-profiles-daemon.enable = true;
    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
    blueman.enable = true;
  };
}
