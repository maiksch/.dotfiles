return {
	{
		"maiksch/monopai.nvim",
		dev = true,
		config = function()
			vim.cmd([[colorscheme monopai]])
		end
	},
	"folke/tokyonight.nvim",
	"andersevenrud/nordic.nvim",
	"phanviet/vim-monokai-pro",
	"rebelot/kanagawa.nvim",
	"loctvl842/monokai-pro.nvim",
	{
		"sainnhe/sonokai",
		config = function()
			-- vim.cmd([[colorscheme sonokai]])
			vim.g.sonokai_style = "shusia"
		end
	},
}
