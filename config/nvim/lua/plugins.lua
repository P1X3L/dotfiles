local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'Mofiqul/dracula.nvim' -- Theme
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more
  use 'lewis6991/gitsigns.nvim' -- Git decorations for current buffers
  use 'dinhhuy258/git.nvim' -- Open github from neovim
  use 'nvimdev/lspsaga.nvim' -- LSP UIs
  use 'MunifTanjim/prettier.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim' -- Telescope dependency
  use 'nvim-telescope/telescope.nvim'
  use 'kylechui/nvim-surround'
  use 'nvim-treesitter/playground'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

end)
