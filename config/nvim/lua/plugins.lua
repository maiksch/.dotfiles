require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Essentials
	use({
		"nvim-lua/plenary.nvim",
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		{ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } },
	})

	-- Themes
	use("folke/tokyonight.nvim")
	use("andersevenrud/nordic.nvim")
	use("phanviet/vim-monokai-pro")

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp", -- completions
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completios
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"L3MON4D3/LuaSnip", -- snippets
		"saadparwaiz1/cmp_luasnip", -- snippet completion
		"hrsh7th/cmp-nvim-lsp", -- lsp completion		-- lsp completion
		"hrsh7th/cmp-nvim-lua", -- lua config completion
	})

	-- Random stuff
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("TimUntersberger/neogit") -- Git
	use("p00f/nvim-ts-rainbow") -- Rainbow brackets

end)

require("plugins/treesitter")
require("plugins/telescope")
require("plugins/cmp")
require("plugins/autopairs")
require("neogit").setup()

-- Configure Nvim LSP Intaller
require("nvim-lsp-installer").setup {
	automatic_installation = true
}
