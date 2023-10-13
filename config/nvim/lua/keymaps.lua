vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Indenting with tab and shift-tab
vim.keymap.set("x", "<Tab>", ">gv")
vim.keymap.set("x", "<S-Tab>", "<gv")

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv-gv")

-- Move to buffer
vim.keymap.set("n", "<leader><Right>", ":bnext<CR>")
vim.keymap.set("n", "<leader><Left>", ":bprevious<CR>")

-- Keep yanked text when pasting over visual selection
--vim.keymap.set("v", "p", "\"_dP")

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Comment
local ok, comment = pcall(require, "Comment")
if ok then
	vim.keymap.set("n", "<C-_>" --[[ CTRL-7 --]], require("Comment.api").toggle.linewise.current)
	vim.keymap.set("v", "<C-_>" --[[ CTRL-7 --]], "<Plug>(comment_toggle_linewise_visual)gv")
end
