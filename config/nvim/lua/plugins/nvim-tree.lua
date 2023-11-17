return {
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e", ":NvimTreeToggle<CR>", desc = "NvimTree" },
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = {},
					float = {
						enable = true,
					},
				},
				update_focused_file = {
					enable = true,
				},
			})
		end
	},
}
