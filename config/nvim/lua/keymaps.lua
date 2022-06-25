function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force",
			outer_opts,
			opts or {}
		)
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

nmap = bind("n", { noremap = false })
nnoremap = bind("n")
vnoremap = bind("v")
xnoremap = bind("x")
inoremap = bind("i")

-- Telescope
nnoremap("<leader>pf", function() 
	require("telescope.builtin").find_files({ hidden = true, file_ignore_patterns = {
		".elixir_ls",
		"deps",
		"_build",
		"node_modules",
		".git"
	}})
end)
nnoremap("<C-p>", require("telescope.builtin").git_files)
nnoremap("<leader>ps", require("telescope.builtin").live_grep)

-- Custom
nnoremap("<leader>c", "<cmd>!xclip -selection clipboard -i %<CR>") -- Write content of current file into clipboard
