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
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		{ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } },
	}

	-- Themes
	use {
		"folke/tokyonight.nvim",
		"andersevenrud/nordic.nvim",
		"phanviet/vim-monokai-pro",
	}

	-- Autocompletion
	use {
		"hrsh7th/nvim-cmp", -- completions
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completios
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"L3MON4D3/LuaSnip", -- snippets
		"saadparwaiz1/cmp_luasnip", -- snippet completion
		"hrsh7th/cmp-nvim-lsp", -- lsp completion		-- lsp completion
		"hrsh7th/cmp-nvim-lua", -- lua config completion
	}

	-- Random stuff
	use {
		"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
		"numToStr/Comment.nvim", -- Easily comment stuff
		"TimUntersberger/neogit", -- Git
		"lewis6991/gitsigns.nvim", -- Git signs
		"p00f/nvim-ts-rainbow", -- Rainbow brackets
		"kyazdani42/nvim-web-devicons", -- Icons for filetree
		"kyazdani42/nvim-tree.lua", -- file tree
	}
end)

require("plugins/treesitter")
require("plugins/telescope")
require("plugins/cmp")
require("plugins/autopairs")
require("plugins/gitsigns")
require("neogit").setup()
require("Comment").setup()
require("nvim-lsp-installer").setup({ automatic_installation = true })
require("nvim-tree").setup()
