local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

-- Keymaps

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ hidden = true, file_ignore_patterns = {
		".elixir_ls",
		"deps",
		"_build",
		"node_modules",
		".git"
	}})
end)
vim.keymap.set("n", "<leader>pb", builtin.git_branches)
vim.keymap.set("n", "<C-p>", builtin.git_files)
vim.keymap.set("n", "<leader>ps", builtin.live_grep)

-- Setup

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
