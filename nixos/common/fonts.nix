{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    # nerd-fonts.fira-code-symbols
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
