return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"numToStr/Comment.nvim", -- Easily comment stuff
		keys = {
			{
				"<C-_>",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
				desc = "Toggle line comment (normal mode)",
			},
			{
				"<C-_>",
				"<Plug>(comment_toggle_linewise_visual)gv",
				desc = "Toggle line comment (visual mode)",
				mode = "v",
			},
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
}
