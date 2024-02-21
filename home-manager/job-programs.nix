{ pkgs, ... }:
{
  home.packages = with pkgs; [
    logseq
    thunderbird
    kubectl
    teams-for-linux
  ];
}
