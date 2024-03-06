{ pkgs, ... }:
{
  home.packages = with pkgs; [
    doctl
    kind
    kubectl
    kubernetes-helm
    kubeseal
    terraform
  ];
}
