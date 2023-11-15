return {
	"folke/trouble.nvim", -- Quickfix
	config = function()
		vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)
	end
}
