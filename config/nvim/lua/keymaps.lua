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

local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")

-- Indenting with tab and shift-tab 
xnoremap("<Tab>", ">gv")
xnoremap("<S-Tab>", "<gv")

-- Move text up and down
nnoremap("<A-j>", "<Esc>:m .+1<CR>==")
nnoremap("<A-k>", "<Esc>:m .-2<CR>==")
vnoremap("<A-j>", ":m .+1<CR>==")
vnoremap("<A-k>", ":m .-2<CR>==")
xnoremap("<A-j>", ":m '>+1<CR>gv-gv")
xnoremap("<A-k>", ":m '<-2<CR>gv-gv")

-- Keep yanked text when pasting over visual selection
vnoremap("p", "\"_dP")

-- Neogit
nnoremap("<leader>git", require("neogit").open)
vim.api.nvim_create_user_command("G", require("neogit").open, {})

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
--nnoremap("<leader>pw", 
nnoremap("<leader>pb", require("telescope.builtin").git_branches)
nnoremap("<C-p>", require("telescope.builtin").git_files)
nnoremap("<leader>ps", require("telescope.builtin").live_grep)

-- Custom
nnoremap("<leader>c", "<cmd>!xclip -selection clipboard -i %<CR>") -- Write content of current file into clipboard
