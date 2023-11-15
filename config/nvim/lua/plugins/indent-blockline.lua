return {
	"lukas-reineke/indent-blankline.nvim", -- Show indent line	
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
		})
	end
}
