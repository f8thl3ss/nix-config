local null_ls = require("null-ls")

local defaults = {
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 5000,
  diagnostic_config = nil,
  diagnostics_format = "#{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "justfile"),
  sources = {
    null_ls.builtins.formatting.prettier,
  },
  temp_dir = nil,
  update_in_insert = false,
}

null_ls.setup(defaults)
