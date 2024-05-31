{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome
    fira-code
    fira-code-symbols
    nerdfonts
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = [ "FiraCode Nerd Font" ];
        sansSerif = [ "Inter" ];
        monospace = [ "FiraCode Nerd Font Mono" ];
        emoji = [ "FiraCode Nerd Font" ];
      };
    };
  };
}
