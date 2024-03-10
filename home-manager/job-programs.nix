{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Secu
    nmap

    # ops
    doctl
    kind
    kubectl
    kubernetes-helm
    kubeseal
    terraform
  ];

  programs.git = {
    userEmail = "cguay@dimonoff.com";
    userName = "Christopher Guay";
  };
}
