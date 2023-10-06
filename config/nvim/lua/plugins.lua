local ok, packer = pcall(require, "packer")
if not ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Essentials
	use {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"nvim-telescope/telescope.nvim",
		{ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } },
		"mhartington/formatter.nvim", -- formatter
		"mfussenegger/nvim-dap", -- debugging with DAP
		"rcarriga/nvim-dap-ui", -- debuggin UI for DAP, 
		"ThePrimeagen/harpoon", -- harpoon
		"nvim-tree/nvim-tree.lua", -- file tree
	}

	-- Themes
	use {
		"folke/tokyonight.nvim",
		"andersevenrud/nordic.nvim",
		"phanviet/vim-monokai-pro",
		"rebelot/kanagawa.nvim",
	}


	-- Autocompletion
	use {
		"hrsh7th/nvim-cmp", -- completions
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completios
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"L3MON4D3/LuaSnip", -- snippets
		"saadparwaiz1/cmp_luasnip", -- snippet completion
		"hrsh7th/cmp-nvim-lsp", -- lsp completion
		"hrsh7th/cmp-nvim-lua", -- lua config completion
	}

	-- Random stuff
	use {
		"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
		"numToStr/Comment.nvim", -- Easily comment stuff
		"TimUntersberger/neogit", -- Git
		"lewis6991/gitsigns.nvim", -- Git signs
		"p00f/nvim-ts-rainbow", -- Rainbow brackets
		"lukas-reineke/indent-blankline.nvim", -- Show indent line	
		"RRethy/vim-illuminate", -- highlight other uses of word
	}
end)

require("Comment").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("illuminate").configure()
