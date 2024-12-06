{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      lazy.enable = true;
      # Treesitter
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins;
          [ nvim-treesitter.withAllGrammars ];
      };

      # Formatting
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };
      none-ls = {
        enable = true;
        sources = {
          formatting = {
            nixfmt.enable = true;
            prettier.enable = true;
            sqlfluff.enable = true;
            sqlformat.enable = true;
            terraform_fmt.enable = true;
            yamlfix.enable = true;
            yamlfmt.enable = true;
          };
        };
      };

      typescript-tools.enable = true;

      # UI and Productivity Plugins
      web-devicons.enable = true;
      mini.enable = true;
      fidget.enable = true;
      trouble.enable = true;
      toggleterm = {
        enable = true;
        settings = {
          size = "vim.o.columns * 0.4";
          open_mapping = ''"<leader>t"'';
          terminal_mappings = true;
          persist_size = true;
          persist_mode = true;
          direction = "vertical";
          auto_scroll = true;
        };
      };
      comment.enable = true;
      nvim-colorizer.enable = true;
      telescope.enable = true;
      lualine.enable = true;
      nvim-tree = {
        enable = true;
        extraOptions = {
          view = { width = 50; };
          filters = {
            git_ignored = false;
            dotfiles = false;
          };
        };
      };
      gitblame.enable = true;
      diffview.enable = true;
      crates-nvim.enable = true;

      # Rust
      rustaceanvim.enable = true;

      avante = {
        settings = {
          provider = "ollama";
          vendors = {
            ollama = {
              __inherited_from = "openai";
              api_key_name = "";
              endpoint = "http://127.0.0.1:11434/v1";
              model = "qwen2.5-coder";
            };
          };
          mappings = {
            ask = "<leader>aa";
            edit = "<leader>ae";
            refresh = "<leader>ar";
          };
        };
        enable = true;
      };

      # Diagnostic
      # diagnostics = {
      #   virtualText = false;
      #   signs = true;
      #   underline = true;
      #   updateInInsert = true;
      # };

      # Debugging
      dap = { enable = true; };

      # AI Assistance

      # Markdown
      render-markdown.enable = true;

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "path"; }
            {
              name = "nvim_lsp";
              keywordLength = 3;
            }
            { name = "nvim_lsp_signature_help"; }
            {
              name = "nvim_lua";
              keywordLength = 2;
            }
            {
              name = "buffer";
              keywordLength = 2;
            }
            {
              name = "vsnip";
              keywordLength = 2;
            }
            { name = "calc"; }
          ];

          # Mapping similar to your current setup
          mapping = {
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<Tab>" = ''
              cmp.mapping(function(fallback) 
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end)'';
            "<C-S-f>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" =
              "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          };

          # Formatting
          formatting = { fields = [ "menu" "abbr" "kind" ]; };

          # Window
          # window = {
          #   completion = "bordered";
          #   documentation = "bordered";
          # };
        };
      };
    };
  };
}
