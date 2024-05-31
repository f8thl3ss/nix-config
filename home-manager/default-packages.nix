{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    bottom
    clang
    cyme
    devenv
    diff-so-fancy
    dig
    direnv
    discord
    docker-compose
    eza # ls replacement
    fd # find replacement
    fzf
    fzy # fuzzy finder
    gh # github cli
    gimp # image editor
    git-lfs # handle large files in git
    glow # markdown renderer
    gtrash # trash cli
    jq
    jujutsu
    just
    killall
    lazygit # git tui
    localsend # send stuff on local network
    luarocks
    ncdu # disk space info (a better du)
    nushell
    ouch # painless compression and decompression for your terminal
    python3
    ripgrep
    s3cmd
    spotify
    tldr
    tree # display files in a tree view
    wireguard-tools
    zellij

    #######
    # DEV #
    #######
    # Bash
    nodePackages_latest.bash-language-server
    shellcheck

    # Docker
    docker-compose-language-service
    dockerfile-language-server-nodejs

    # Rust
    cargo
    cargo-shuttle
    lldb
    rust-analyzer

    # Python
    nodePackages_latest.pyright
    ruff
    ruff-lsp

    # Ops
    # awscli2
    terraform
    terraform-ls
    helm-ls
    yaml-language-server
    hadolint

    # Typescript 
    nodejs
    nodePackages_latest.pnpm
    nodePackages_latest.prettier
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    nodePackages_latest.volar
    nodePackages_latest.vscode-langservers-extracted

    # Lua
    lua-language-server
    luaformatter

    # Nix
    nil
    nixpkgs-fmt
    manix

    # General
    gh-markdown-preview
    shellcheck
    tree-sitter
    zig
  ];
}
