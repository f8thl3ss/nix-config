{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    bat
    bottom
    clang
    cyme
    fluffychat
    devenv
    diff-so-fancy
    dig
    direnv
    discord
    docker-compose
    eza # ls replacement
    fd # find replacement
    floorp
    fzf
    fzy # fuzzy finder
    gh # github cli
    gimp # image editor
    git-lfs # handle large files in git
    glow # markdown renderer
    gtrash # trash cli
    harper
    jq
    jujutsu
    just
    killall
    lazygit # git tui
    (lib.hiPrio localsend) # send stuff on local network
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
    # zen-browser

    #######
    # DEV #
    #######
    # Bash
    bash-language-server
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
    pyright
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
    vscode-extensions.vue.volar
    nodePackages_latest.vscode-langservers-extracted

    # Vuejs
    vue-language-server

    # Lua
    lua-language-server
    luaformatter

    # Nix
    nil
    nixd
    nixpkgs-fmt
    manix

    # General
    gh-markdown-preview
    shellcheck
    tree-sitter
    zig
  ];
}
