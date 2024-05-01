{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Other
    gh-markdown-preview
    joplin-desktop

    # Secu
    nmap

    # Databases
    usql
    pgcli

    # ops
    doctl
    k9s
    kind
    kubectl
    kubernetes-helm
    kubeseal
    lima
    mysql
    terraform
  ];

  programs.git = {
    userEmail = "cguay@dimonoff.com";
    userName = "Christopher Guay";
  };
}
