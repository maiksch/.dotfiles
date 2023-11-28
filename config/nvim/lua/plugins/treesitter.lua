return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "toml", "typescript", "javascript", "css", "html", "json", "sql", "go" },
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
					disable = {},
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
			})
		end
	},
	{
		"nvim-treesitter/playground",
	}
}
