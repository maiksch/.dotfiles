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
		"mfussenegger/nvim-dap", -- debugging with DAP
		"rcarriga/nvim-dap-ui", -- debuggin UI for DAP,
		"ThePrimeagen/harpoon", -- harpoon
		"nvim-tree/nvim-tree.lua", -- file tree
		{ "mbbill/undotree", config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end },
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
		"hrsh7th/nvim-cmp",              -- completions
		"hrsh7th/cmp-buffer",            -- buffer completions
		"hrsh7th/cmp-path",              -- path completios
		"hrsh7th/cmp-cmdline",           -- cmdline completions
		"hrsh7th/vim-vsnip",             -- snippets
		"hrsh7th/vim-vsnip-integ",
		"hrsh7th/cmp-nvim-lsp",          -- lsp completion
		"hrsh7th/cmp-nvim-lua",          -- lua config completion
		"hrsh7th/cmp-nvim-lsp-signature-help", -- show signature help when typing function
	}

	-- Random stuff
	use {
		"windwp/nvim-autopairs",         -- Autopairs, integrates with both cmp and treesitter
		"windwp/nvim-ts-autotag",        -- Autotags for HTML
		"numToStr/Comment.nvim",         -- Easily comment stuff
		"TimUntersberger/neogit",        -- Git
		"lewis6991/gitsigns.nvim",       -- Git signs
		"p00f/nvim-ts-rainbow",          -- Rainbow brackets
		"lukas-reineke/indent-blankline.nvim", -- Show indent line	
		"RRethy/vim-illuminate",         -- highlight other uses of word
		"folke/trouble.nvim",            -- Quickfix
		{
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("which-key").setup()
			end
		}, -- show possible keybindings for the command thats being typed
	}
end)

require("Comment").setup()
