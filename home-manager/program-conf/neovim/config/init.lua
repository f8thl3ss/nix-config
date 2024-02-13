require("user.dap-keys")
require("user.plugins")
require("user.dap-configuration")
require("user.treesitter")
require("user.navigate")
require("user.opts")
require("user.status-line")
require("user.trouble-setup")
require("user.theme")
require("user.statuscol")
require('user.null-ls-config')

require("dapui").setup()
require('Comment').setup()
require('colorizer').setup()
require("actions-preview").setup {
  telescope = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.8,
      height = 0.9,
      prompt_position = "top",
      preview_cutoff = 20,
      preview_height = function(_, _, max_lines)
        return max_lines - 15
      end,
    },
  },
}
require("toggleterm").setup {
  size = vim.o.columns * 0.4,
  open_mapping = '<Leader>t',
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
  direction = 'vertical',
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}

-- Mappings.
-- Lsp diagnostic mapping
vim.g.inlay_hints_visible = true
local lc = require("user.lsp-config")

-- LANGUAGE SERVERS --

require('lspconfig').nil_ls.setup {
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
  on_attach = lc.on_attach
}

require("typescript-tools").setup {
  on_attach = lc.on_attach
}
require 'lspconfig'.lua_ls.setup {
  on_attach = lc.on_attach,
  settings = {
    format = {
      enable = true,
    },
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
--[[require 'lspconfig'.rome.setup {]]
--[[on_attach = lc.on_attach,]]
--[[}]]
require 'lspconfig'.graphql.setup {
  on_attach = lc.on_attach,
}
require 'lspconfig'.terraformls.setup {
  on_attach = lc.on_attach,
  settings = {
    filetype = { "terraform", "terraform-vars", "tf" }
  }
}
require 'lspconfig'.volar.setup {
  on_attach = lc.on_attach,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
--[[require 'codeium'.setup({]]
--[[wrapper = "steam-run"]]
--[[})]]
require 'lspconfig'.tailwindcss.setup({
  on_attach = lc.on_attach,
  cmd = { "npx", "tailwindcss-language-server", "--stdio" }
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
require 'lspconfig'.eslint.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require 'lspconfig'.pyright.setup {
  on_attach = lc.on_attach,
}
require 'lspconfig'.ruff_lsp.setup {
  on_attach = lc.on_attach,
}

-- Docker
require 'lspconfig'.docker_compose_language_service.setup {
  on_attach = lc.on_attach,
  filetypes = {
    "yaml"
  },
}
require 'lspconfig'.dockerls.setup {
  on_attach = lc.on_attach,
  filetypes = {
    "dockerfile"
  }
}


-- Rust
vim.g.rustaceanvim = function()
  -- Update this path
  local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  local liblldb_path = extension_path .. 'lldb/lib/liblldb'
  local this_os = vim.uv.os_uname().sysname;

  -- The path is different on Windows
  if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local cfg = require('rustaceanvim.config')
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
      on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(bufnr, true)
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
        lc.on_attach(client, bufnr)
      end,
    },
  }
end
