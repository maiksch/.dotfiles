return {
	"TimUntersberger/neogit", -- Git
	config = function()
		local neogit = require("neogit")

		neogit.setup()

		vim.keymap.set("n", "<leader>g", neogit.open)
	end
}
