{ config, pkgs, lib, ... }:

{
  fonts.packages = with pkgs; [
    iosevka
    inter
    roboto
    noto-fonts-emoji
    font-awesome
    fira-code
    fira-code-symbols
    victor-mono
    (nerdfonts.override { fonts = [ "FiraCode" "VictorMono" ]; })
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = [ "Roboto Slab" ];
        sansSerif = [ "Inter" ];
        monospace = [ "VictorMono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
