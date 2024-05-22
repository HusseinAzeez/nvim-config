-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use({
	  'nvim-telescope/telescope.nvim',
	  requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-tree/nvim-web-devicons'},
      }
  })

  -- use({
	 --  'rose-pine/neovim',
	 --  as = 'rose-pine',
	 --  config = function()
		--   vim.cmd('colorscheme rose-pine')
	 --  end
  -- })

  use({
      'https://gitlab.com/madyanov/gruber.vim',
      as = 'gruber',
      lock = true,
	  config = function()
		  vim.cmd('colorscheme gruber')
	  end
  })

  use({
      'folke/trouble.nvim',
      config = function()
          require("trouble").setup {
              icons = false,
          }
      end
  })

  use({
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end
  })

  use({
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  })

  use({
      'pwntester/octo.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope.nvim',
          'nvim-tree/nvim-web-devicons',
      },
      config = function()
          require "octo".setup()
      end
  })

  -- Smoth scroll
  use "karb94/neoscroll.nvim"

  use({
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
     })
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("laytan/cloak.nvim")
  use("ThePrimeagen/vim-be-good")

  -- use({
  --     'Exafunction/codeium.vim',
  --     config = function ()
  --         -- Change '<C-g>' here to any keycode you like.
  --         vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  --         vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
  --         vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  --         vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  --     end
  -- })

  use("tpope/vim-dadbod")
  use("kristijanhusak/vim-dadbod-completion")
  use("kristijanhusak/vim-dadbod-ui")
  use("stevearc/oil.nvim")
end)

