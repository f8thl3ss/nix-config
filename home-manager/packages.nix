{ pkgs, ... }:
{
  home.packages = with pkgs; [

    _1password-gui
    appimage-run
    bat
    clang
    cyme
    diff-so-fancy
    dig
    direnv
    discord
    docker-compose
    emote
    eza
    fd
    firefox
    fzf
    fzy
    gh
    gimp
    git-lfs
    gnome.gnome-boxes
    google-chrome
    htop
    imagemagick
    inkscape
    jq
    just
    killall
    lazygit
    libreoffice
    localsend
    luarocks
    ncdu # disk space info (a better du)
    nushell
    ouch # painless compression and decompression for your terminal
    packer
    powertop
    prusa-slicer
    python3
    ripgrep
    s3cmd
    spotify
    steam
    steam-run
    tailscale
    thunderbird
    timeshift
    tldr
    tree # display files in a tree view
    unzip
    vlc
    watchmate
    winetricks
    wineWowPackages.waylandFull
    wireguard-tools
    wl-clipboard
    xsel # clipboard support (also for neovim)
    zellij
    #######
    # DEV #
    #######
    # Docker
    docker-compose-language-service
    dockerfile-language-server-nodejs

    # fly.io
    flyctl

    # Rust
    cargo
    cargo-shuttle
    lldb
    rust-analyzer-unwrapped
    vscode-extensions.vadimcn.vscode-lldb

    # Python
    nodePackages_latest.pyright
    ruff
    ruff-lsp

    # Ops
    awscli2
    terraform
    terraform-ls

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
    tree-sitter
    zig
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config cargo ]);
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.htop = {
    enable = true;
    settings = {
      sort_direction = true;
      sort_key = "PERCENT_CPU";
    };
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza";
      cd = "z";
      lsusb = "cyme";
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
