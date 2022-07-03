local function hi(what, opts)
	vim.api.nvim_set_hl(0, what, opts)
end

local function tokyonight()
	vim.cmd [[colorscheme tokyonight]]
	hi("LineNr", { fg = "#5eacd3" })
	hi("Normal", { bg = "none" })
	hi("SignColumn", { bg = "none" })
	hi("GitSignsAdd", { fg = "green" })
	hi("GitSignsChange", { fg = "yellow" })
end

tokyonight()

--hi("NonText", { bg = "None" })
