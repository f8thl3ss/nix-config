{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs; [ vimPlugins.lazy-nvim vimPlugins.copilot-lua ];

    extraConfig = ''
      :luafile ~/.config/nvim/lua/init.lua
    '';
  };


  xdg.configFile."nvim".source = builtins.path {
    path = ./config;
    name = "neovim-config";
  };
}
