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
	require("kanagawa").setup()
	vim.cmd("colorscheme kanagawa")
end

-- kanagawa()
tokyonight()

hi("LineNr", { fg = "#5eacd3" })
hi("GitSignsAdd", { fg = "green" })
hi("GitSignsChange", { fg = "yellow" })
-- hi("Normal", { bg = "none" })
-- hi("SignColumn", { bg = "none" })
