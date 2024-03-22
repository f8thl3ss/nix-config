return require("lazy").setup({
  'vim-test/vim-test',
  { 'numToStr/Comment.nvim', lazy = false },
  'NoahTheDuke/vim-just',
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'brooth/far.vim',
  'zivyangll/git-blame.vim',

  -- Tree sitter
  'nvim-treesitter/nvim-treesitter',
  'mrcjkb/rustaceanvim',

  -- Completion
  'hrsh7th/nvim-cmp',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/vim-vsnip',
  {
    "nvimtools/none-ls.nvim",
    depencencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  -- Optional
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',

  -- css
  'NvChad/nvim-colorizer.lua',

  -- Git Diff
  'sindrets/diffview.nvim',

  -- Status line
  'nvim-lualine/lualine.nvim',
  'arkav/lualine-lsp-progress',

  -- Diagnostic
  "folke/trouble.nvim",

  -- Theme
  { "catppuccin/nvim",       as = "catppuccin" },
  "rebelot/kanagawa.nvim",
  { 'rose-pine/neovim',     as = 'rose-pine' },
  {
    'uloco/bluloco.nvim',
    dependencies = { 'rktjmp/lush.nvim' }
  },
  "savq/melange-nvim",

  -- Format
  "lukas-reineke/lsp-format.nvim",
  'MunifTanjim/prettier.nvim',

  -- Debug
  { "nvim-neotest/nvim-nio" },
  'mfussenegger/nvim-dap',
  "nvim-neotest/nvim-nio",
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

  -- Typescript
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- Ui
  'kosayoda/nvim-lightbulb',
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
    end,
  },
  "luukvbaal/statuscol.nvim",

  "David-Kunz/gen.nvim",

  -- Ai
  "zbirenbaum/copilot.lua",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- {
  --   "jcdickinson/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require 'codeium'.setup({
  --       wrapper = "steam-run"
  --     })
  --   end
  -- },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = '*',
  },
})
