local function hi(what, opts)
	vim.api.nvim_set_hl(0, what, opts)
end

local function tokyonight()
	require("tokyonight").setup {
		transparent = true,
		styles = {
			keywords = { italic = false },
		},
	}
	vim.cmd("colorscheme tokyonight")
end

local function kanagawa()
	require('kanagawa').setup({
		theme = "dragon",
		background = {
			dark = "dragon"
		}
		-- transparent = trtrue,ue,
	})
	vim.cmd("colorscheme kanagawa")
end

local function monokai_pro()
	require("monokai-pro").setup()
	vim.cmd([[colorscheme monokai-pro]])
end
