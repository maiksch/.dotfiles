local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	view = {
		width = {},
		float = {
			enable = true,
		},
	}
})

vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")
