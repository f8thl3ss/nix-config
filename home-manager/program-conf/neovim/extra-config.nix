{ pkgs, ... }: {
  programs.nixvim = {
    # Extra Configuration
    # extraConfigLua = ''
    #   vim.opt.numberwidth = 3
    #   vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''\}%=%s"
    #
    #   -- Any additional Lua configuration can go here
    #   -- For example, custom actions-preview setup from your init.lua
    #   require("actions-preview").setup {
    #     telescope = {
    #       sorting_strategy = "ascending",
    #       layout_strategy = "vertical",
    #       layout_config = {
    #         width = 0.8,
    #         height = 0.9,
    #         prompt_position = "top",
    #         preview_cutoff = 20,
    #         preview_height = function(_, _, max_lines)
    #           return max_lines - 15
    #         end,
    #       },
    #     },
    #   }
    #   -- Any additional Lua configuration can go here
    #   -- For example, custom actions-preview setup from your init.lua
    #   require("actions-preview").setup {
    #     telescope = {
    #       sorting_strategy = "ascending",
    #       layout_strategy = "vertical",
    #       layout_config = {
    #         width = 0.8,
    #         height = 0.9,
    #         prompt_position = "top",
    #         preview_cutoff = 20,
    #         preview_height = function(_, _, max_lines)
    #           return max_lines - 15
    #         end,
    #       },
    #     },
    #   }
    #
    #
    #   require('lualine').setup {
    #     options = {
    #       theme = "catppuccin"
    #     },
    #     sections = {
    #       lualine_a = { { 'filename', file_status = false, path = 1 } },
    #       lualine_c = { 'lsp_progress' }
    #     }
    #   }
    # '';
  };
}
