{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kubectl
    doctl
    kubernetes-helm
    kind
    terraform
  ];
}
