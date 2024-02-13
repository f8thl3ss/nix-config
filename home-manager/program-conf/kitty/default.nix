{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
  };
  xdg.configFile."kitty".source = builtins.path {
    path = ./config;
    name = "kitty-config";
  };
}
