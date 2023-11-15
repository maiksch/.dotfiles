return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>", vim.cmd.UndotreeToggle)
	end
}
