{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rio
  ];

  xdg.configFile."rio".source = builtins.path {
    path = ./config;
    name = "rio-config";
  };
}
