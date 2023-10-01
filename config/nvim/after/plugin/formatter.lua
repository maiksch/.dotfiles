local ok, formatter = pcall(require, "formatter")
if not ok then
	return
end

formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		go = {
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").goimports,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		javascript = {
			require("formatter.filetypes.html").prettier,
		},
		typescript = {
			require("formatter.filetypes.html").prettier,
		},
		-- any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>f", ":Format<CR>")
