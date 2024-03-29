return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			desc = "Conform: Format",
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				gohtml = { "prettier" },
				json = { "prettier" },
				yml = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
			},
		})
	end,
}
