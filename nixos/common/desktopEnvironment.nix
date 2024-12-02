{ pkgs, ... }:
{
  #########
  # Gnome #
  #########
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    pop-shell
    # gesture-improvements
    # ...
  ];

  #######
  # KDE #
  #######
  # services.desktopManager.plasma6.enable = true;
  # services.displayManager.defaultSession = "plasma";
  # services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.sddm.enable = true;
  programs.kdeconnect.enable = true;


  ##########
  # cosmic #
  ##########
  # services.displayManager.cosmic-greeter.enable = true;
  # services.desktopManager.cosmic.enable = true;
}
