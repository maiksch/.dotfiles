vim.opt.guicursor = "i-ci-ve:hor25"
vim.opt.relativenumber = true -- Relative Zeilennummern vom Cursor
vim.opt.nu = true --Zeigt ausserdem die aktuelle Zeilennummer
vim.opt.hidden = true --Buffer bleiben im Hintergrund offen
vim.opt.errorbells = false -- Keine Fehlersounds
vim.opt.tabstop = 4 -- Tabs haben eine Länge von 4 Zeichen
vim.opt.shiftwidth = 4
vim.opt.smartindent = true -- Automatisch intelligent einrücken
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true -- Während der Suche die Ergebnisse inkrementell highlighten
vim.opt.scrolloff = 8 -- 8 Zeilen vor Anfang und Ende der Datei scrollen
vim.opt.signcolumn = "yes" -- Blende links von den Zeilennummern eine weiter Spalte in
vim.opt.colorcolumn = "80" -- Blende eine Spalte bei 80 Zeichen ein
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd [[hi Normal ctermbg=none guibg=none]] -- Transparenter Hintergrund
vim.g.mapleader = " " -- Leerzeichen als Leader verwenden

