# LSP Configuration

{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          # Nix
          nil_ls = {
            enable = true;
            settings = {
              formatting = {
                command = [ "nixpkgs-fmt" ];
              };
            };
          };
          nixd.enable = true;

          # TypeScript / Vue
          volar = {
            enable = true;
          };

          # ts-ls.enable = true; = {
          #   enable = true;
          #   filetypes = [ "javascript" "typescript" "vue" ];
          #   initOptions = {
          #     plugins = [{
          #       name = "@vue/typescript-plugin";
          #       location = "/nix/store/8qmcn7iv9zhphns4bavp8nzqk3mrf0ha-vue-language-server-2.1.6/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin";
          #       languages = [ "javascript" "typescript" "vue" ];
          #     }];
          #   };
          # };

          # Web Dev
          tailwindcss.enable = true;
          eslint.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          html.enable = true;

          # Other Languages
          lua_ls = {
            enable = true;
            settings = {
              runtime.version = "LuaJIT";
              diagnostics.globals = [ "vim" ];
              # workspace.library = [ "\${vim.api.nvim_get_runtime_file(\"\", true)}" ];
              telemetry.enable = false;
            };
          };
          graphql.enable = true;
          terraformls.enable = true;
          pyright.enable = true;
          ruff.enable = true;

          # Docker / Kubernetes
          dockerls.enable = true;
          docker_compose_language_service.enable = true;
          helm_ls.enable = true;
          bashls.enable = true;
        };
      };
    };
  };
}
