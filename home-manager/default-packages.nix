{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    # chromium
    clang
    cyme
    diff-so-fancy
    dig
    direnv
    discord
    docker-compose
    eza
    fd
    fzf
    fzy
    gh
    gimp
    git-lfs
    jq
    just
    killall
    lazygit
    localsend
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
    rust-analyzer-unwrapped

    # Python
    nodePackages_latest.pyright
    ruff
    ruff-lsp

    # Ops
    awscli2
    terraform
    terraform-ls
    helm-ls
    yaml-language-server

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
    nix-index

    # General
    codeium
    gh-markdown-preview
    shellcheck
    tree-sitter
    zig
  ];


}
