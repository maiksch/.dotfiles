return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						mirror = false,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = true,
					layout_strategy = "horizontal",
				},
				git_files = {
					theme = "dropdown",
					previewer = false,
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-p>", function()
			builtin.find_files({
				hidden = true,
				file_ignore_patterns = {
					"^.git/",
					"^node_modules/",
				}
			})
		end)
		vim.keymap.set("n", "<leader>pb", builtin.git_branches, { desc = "Telescope: Git Branches" })
		vim.keymap.set("n", "<leader>pf", builtin.git_files, { desc = "Telescope: Git Files" })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope: Grep" })
		vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope: Diagnostics" })
	end
}
