local ok, neogit = pcall(require, "neogit")

neogit.setup()

vim.keymap.set("n", "<leader>g", neogit.open)
