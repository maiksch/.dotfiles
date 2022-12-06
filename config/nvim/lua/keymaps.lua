local M = {}

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
local inoremap = bind("i")
local xnoremap = bind("x")

nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

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

-- Move to buffer
nnoremap("<leader><Right>", ":bnext<CR>")
nnoremap("<leader><Left>", ":bprevious<CR>")

-- nnoremap("<leader> h", )

-- Keep yanked text when pasting over visual selection
--vnoremap("p", "\"_dP")

-- Neogit
local ok, neogit = pcall(require, "neogit")
if ok then
	nnoremap("<leader>git", neogit.open)
	vim.api.nvim_create_user_command("G", neogit.open, {})
end

-- Telescope
local ok, telescope = pcall(require, "telescope.builtin")
if ok then
	nnoremap("<leader>pf", function()
		telescope.find_files({ hidden = true, file_ignore_patterns = {
			".elixir_ls",
			"deps",
			"_build",
			"node_modules",
			".git"
		}})
	end)
	nnoremap("<leader>pb", telescope.git_branches)
	nnoremap("<C-p>", telescope.git_files)
	nnoremap("<leader>ps", telescope.live_grep)
end

-- Comment
local ok, comment = pcall(require, "Comment")
if ok then
	nnoremap("<C-_>" --[[ CTRL-7 --]], require("Comment.api").toggle.linewise.current)
	vnoremap("<C-_>" --[[ CTRL-7 --]], "<Plug>(comment_toggle_linewise_visual)gv")
end

M.nnoremap = nnoremap
M.inoremap = inoremap
M.vnoremap = vnoremap

return M
