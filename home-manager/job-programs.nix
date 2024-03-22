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

    # ops
    doctl
    k9s
    kind
    kubectl
    kubernetes-helm
    kubeseal
    mysql
    terraform
  ];

  programs.git = {
    userEmail = "cguay@dimonoff.com";
    userName = "Christopher Guay";
  };
}
