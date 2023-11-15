local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("sets")
require("keymaps")
require("lazy").setup({
	"numToStr/Comment.nvim", -- Easily comment stuff
	"p00f/nvim-ts-rainbow", -- Rainbow brackets
	{ import = "plugins" }
})
require("theme")
