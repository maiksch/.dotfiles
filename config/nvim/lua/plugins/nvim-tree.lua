return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = {
					width = {},
					float = {
						enable = true,
					},
				}
			})

			vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")
		end
	},
}
