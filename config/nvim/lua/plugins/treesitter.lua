local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

treesitter.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = { "#ffd700", "#da70d6", "#87cefa" }, -- table of hex strings
		--termcolors = { "Gold", "Purple", "Blue" }, -- table of colour name strings
	}
})
