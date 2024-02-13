require('lualine').setup {
  options = {
    theme = "catppuccin"
  },
  sections = {
    lualine_a = { { 'filename', file_status = false, path = 1 } },
    lualine_c = { 'lsp_progress' }
  }
}
