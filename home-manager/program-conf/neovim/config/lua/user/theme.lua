require("catppuccin").setup({})
require("bluloco").setup({
  style       = "light", -- "auto" | "dark" | "light"
  transparent = false,
  italics     = false,
  guicursor   = true,
})
require("rose-pine").setup({})

vim.opt.termguicolors = true
-- vim.cmd('colorscheme bluloco')
vim.cmd.colorscheme "catppuccin"
--[[variant = "moon"]]
--[[})]]
-- vim.cmd.colorscheme "rose-pine"
