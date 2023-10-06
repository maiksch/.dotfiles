local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup()

vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")
