{ pkgs, system, ... }:
let
  name = "rio-config";
  path = if system == "aarch64-darwin" then ./darwin-config else ./config;
in
{
  home.packages = with pkgs; [
    rio
  ];

  xdg.configFile."rio".source = builtins.path {
    inherit path;
    inherit name;
  };

}
