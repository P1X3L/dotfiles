local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"Mofiqul/dracula.nvim", -- Theme
	"onsails/lspkind-nvim", -- vscode-like pictograms
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
	"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
	"hrsh7th/nvim-cmp", -- Completion
	"neovim/nvim-lspconfig", -- LSP
	"lewis6991/gitsigns.nvim", -- Git decorations for current buffers
	"dinhhuy258/git.nvim", -- Open github from neovim
	"nvimdev/lspsaga.nvim", -- LSP UIs
	"MunifTanjim/prettier.nvim",
	"nvim-lualine/lualine.nvim",
	"windwp/nvim-ts-autotag",
	"windwp/nvim-autopairs",
	"kyazdani42/nvim-web-devicons",
	"nvim-lua/plenary.nvim", -- Telescope dependency
	"nvim-telescope/telescope.nvim",
	"kylechui/nvim-surround",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"github/copilot.vim",
	"stevearc/conform.nvim",
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
	},
})
