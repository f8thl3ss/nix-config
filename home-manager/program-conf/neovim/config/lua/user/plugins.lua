vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'vim-test/vim-test'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'NoahTheDuke/vim-just'
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'brooth/far.vim'
  use 'zivyangll/git-blame.vim'

  -- Tree sitter
  use 'nvim-treesitter/nvim-treesitter'

  use({
    'mrcjkb/rustaceanvim',
  })

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/vim-vsnip'
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*",
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })

  -- Dotenv
  use { "ellisonleao/dotenv.nvim" }

  -- Optional
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- css
  use 'NvChad/nvim-colorizer.lua'

  -- Git Diff
  use 'sindrets/diffview.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'

  -- Diagnostic
  use "folke/trouble.nvim"

  -- Theme
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' }
  }

  -- Format
  use "lukas-reineke/lsp-format.nvim"
  use('MunifTanjim/prettier.nvim')

  -- Debug
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- Typescript
  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {}
    end,
  }

  -- Ui
  use { 'kosayoda/nvim-lightbulb' }
  use {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
    end,
  }
  use {
    "luukvbaal/statuscol.nvim"
  }

  -- Ai
  -- use {
  --   "jcdickinson/codeium.nvim",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({
  --       -- config = function()
  --       --   -- Change '<C-g>' here to any keycode you like.
  --       -- end
  --     })
  --   end
  -- }

  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end
  }
end)
