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
	-- "p00f/nvim-ts-rainbow", -- Rainbow brackets
	-- "hiphish/rainbow-delimiters.nvim",
	{ import = "plugins" },
}, {
	dev = {
		path = "~/Projects",
		fallback = true,
	}
})
require("theme")
