# { pkgs, ... }:
# {
#   programs.neovim = {
#     enable = true;
#     viAlias = true;
#     vimAlias = true;
#     plugins = with pkgs; [
#       vimPlugins.lazy-nvim
#       vimPlugins.nvim-treesitter.withAllGrammars
#       vimPlugins.avante-nvim
#
#       # -- Setup the plugin
#       # avante.setup {
#       #   provider = "ollama",
#       #   vendors = {
#       #     ollama = {
#       #       __inherited_from = "openai",
#       #       api_key_name = "",
#       #       endpoint = "http://127.0.0.1:11434/v1",
#       #       model = "qwen2.5-coder:latest",
#       #     },
#       #   },
#       # }
#       # EN
#     ];
#     extraConfig = ''
#       :luafile ~/.config/nvim/lua/init.lua
#     '';
#   };
#
#   xdg.configFile."nvim".source = builtins.path {
#     path = ./config;
#     name = "neovim-config";
#   };
# }

{ pkgs, ... }: {
  imports = [
    ./lsp.nix
    ./dap.nix
    ./keymaps.nix
    ./extra-config.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Global Options
    opts = {
      # From opts.lua
      encoding = "utf-8";
      number = true;
      relativenumber = false;
      tabstop = 2;
      shiftwidth = 2;
      splitbelow = true;
      splitright = true;
      expandtab = true;
      signcolumn = "yes";
      completeopt = [ "menuone" "noselect" "noinsert" ];
      updatetime = 300;
      clipboard = "unnamedplus";
    };
    colorschemes.catppuccin.enable = true;
  };
}
