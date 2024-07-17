local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
	-- Core
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",

	-- Essentials
	"nvim-telescope/telescope.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	-- Colorscheme
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

	-- Navigator sync with tmux
	"christoomey/vim-tmux-navigator",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Snippets
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Autocompletion
			"hrsh7th/nvim-cmp", -- Required
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				run = "make install_jsregexp", -- Required
			},
			"rafamadriz/friendly-snippets",
			"jose-elias-alvarez/null-ls.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
	},

	-- Utilities
	"akinsho/toggleterm.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"tpope/vim-surround",
	"p00f/nvim-ts-rainbow",
	"mbbill/undotree",
	"folke/todo-comments.nvim",
	"folke/trouble.nvim",
	"folke/twilight.nvim",
	"norcalli/nvim-colorizer.lua",
})

require("sarunmrzn")
