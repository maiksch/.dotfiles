local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " " ,
		path_display = { "smart" },
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		git_files = {
			theme = "dropdown",
			previewer = false,
		},
	}
}
