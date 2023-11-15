return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
		require("which-key").setup()
	end
}  -- show possible keybindings for the command thats being typed
