return {
	"TimUntersberger/neogit", -- Git
	keys = {
		{ "<leader>g", function() require("neogit").open() end, desc = "Neogit" },
	},
	config = function()
		require("neogit").setup()
	end
}
