return {
	{
		"ThePrimeagen/harpoon", -- harpoon
		config = function()
			local ui = require("harpoon.ui")
			local mark = require("harpoon.mark")

			vim.keymap.set("n", "<leader>ha", function() mark.add_file() end, { desc = "Harpoon Add File" })
			vim.keymap.set("n", "<leader>hh", function() ui.toggle_quick_menu() end, { desc = "Harpoon List" })
			vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon File 1" })
			vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon File 2" })
			vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon File 3" })
			vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon File 4" })
			vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon File 5" })
		end
	}
}
