return {
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	dependencies = { "windwp/nvim-ts-autotag", "hrsh7th/nvim-cmp" },
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			fast_wrap = {
				map = "<M-e>"
			}
		})

		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
}
