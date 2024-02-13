{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
    plugins = [ pkgs.vimPlugins.codeium-vim ];

    extraConfig = ''
      :luafile ~/.config/nvim/lua/init.lua
    '';
  };


  xdg.configFile."nvim".source = builtins.path {
    path = ./config;
    name = "neovim-config";
  };
}
