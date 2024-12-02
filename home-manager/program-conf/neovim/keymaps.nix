{ pkgs, ... }: {
  programs.nixvim = {
    # Keymappings
    keymaps = [
      # DAP Keymaps
      { mode = "n"; key = "<F5>"; action = "<cmd>lua require('dap').continue()<CR>"; }
      { mode = "n"; key = "<F10>"; action = "<cmd>lua require('dap').step_over()<CR>"; }
      { mode = "n"; key = "<F11>"; action = "<cmd>lua require('dap').step_into()<CR>"; }
      { mode = "n"; key = "<F12>"; action = "<cmd>lua require('dap').step_out()<CR>"; }
      { mode = "n"; key = "<leader>B"; action = "<cmd>lua require('dap').toggle_breakpoint()<CR>"; }
      { mode = "n"; key = "<leader>lp>"; action = "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"; }
      { mode = "n"; key = "<leader>dr"; action = "<cmd>lua require('dap').repl.open()<CR>"; }
      { mode = "n"; key = "<leader>dl"; action = "<cmd>lua require('dap').run_last()<CR>"; }

      # Terminal
      { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; }

      # Navigation
      { mode = "i"; key = "<C-o>"; action = "<C-\\><C-n>"; }
      { mode = "n"; key = "<C-K>"; action = "<C-W><C-K>"; }
      { mode = "n"; key = "<C-L>"; action = "<C-W><C-L>"; }
      { mode = "n"; key = "<C-H>"; action = "<C-W><C-H>"; }

      # NvimTree
      { mode = "n"; key = "<C-k>"; action = "<Cmd>NvimTreeToggle<CR>"; }
      { mode = "n"; key = "<leader>r"; action = "<Cmd>NvimTreeRefresh<CR>"; }
      { mode = "n"; key = "<leader>n"; action = "<Cmd>NvimTreeFindFile<CR>"; }

      # Git Blame
      { mode = "n"; key = "<leader>b"; action = "<C-u>call gitblame#echo()<CR>"; }

      # Telescope
      { mode = "n"; key = "<C-j>"; action = "<CMD>lua require('telescope.builtin').find_files()<CR>"; }
      { mode = "n"; key = "<C-l>"; action = "<CMD>lua require('telescope.builtin').live_grep()<CR>"; }
      { mode = "n"; key = "<leader>fb"; action = "<CMD>lua require('telescope.builtin').buffers()<CR>"; }
      { mode = "n"; key = "<leader>fbh"; action = "<CMD>lua require('telescope.builtin').help_tags()<CR>"; }
      { mode = "n"; key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle<cr>"; }

      # Diagnostics
      { mode = "n"; key = "]g"; action = "<cmd>lua vim.diagnostic.goto_next()<CR>"; }
      { mode = "n"; key = "[g"; action = "<cmd>lua vim.diagnostic.goto_prev()<CR>"; }

      # LSP Keymaps (from lsp-config.lua)
      { mode = "n"; key = "gD"; action = "<cmd>lua vim.lsp.buf.declaration()<CR>"; }
      { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<CR>"; }
      { mode = "n"; key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<CR>"; }
      { mode = "n"; key = "gi"; action = "<cmd>lua vim.lsp.buf.implementation()<CR>"; }
      { mode = "n"; key = "<C-s>"; action = "<cmd>lua vim.lsp.buf.signature_help()<CR>"; }
      { mode = "n"; key = "<space>wa"; action = "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>"; }
      { mode = "n"; key = "<space>wr"; action = "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>"; }
      { mode = "n"; key = "<space>D"; action = "<cmd>lua vim.lsp.buf.type_definition()<CR>"; }
      { mode = "n"; key = "<leader>rn"; action = "<cmd>lua vim.lsp.buf.rename()<CR>"; }
      { mode = "n"; key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; }
      { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<CR>"; }
      { mode = "n"; key = "<space>f"; action = "function() vim.lsp.buf.format { async = true } end"; }
    ];
  };
}
