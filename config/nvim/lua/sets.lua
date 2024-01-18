local sets = {
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	mouse = "a", -- enables the mouse
	guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:hor25-Cursor2/lCursor2",
	fileencoding = "utf-8",
	relativenumber = true, -- Relative Zeilennummern vom Cursor
	nu = true, -- Zeigt ausserdem die aktuelle Zeilennummer
	hidden = true, -- Buffer bleiben im Hintergrund offen
	errorbells = false, -- Keine Fehlersounds
	tabstop = 4, -- Tabs haben eine Länge von 4 Zeichen
	shiftwidth = 2,
	showtabline = 0, -- Dateiname in der oberen linken Ecke (0 = ausblenden)
	smartindent = true, -- Automatisch intelligent einrücken
	smartcase = true, -- smart case
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	incsearch = true, -- Während der Suche die Ergebnisse inkrementell highlighten
	hlsearch = false, -- Entfernt highlighting bei der Suche
	scrolloff = 8, -- 8 Zeilen vor Anfang und Ende der Datei scrollen
	sidescrolloff = 8,
	signcolumn = "yes", -- Blende links von den Zeilennummern eine weiter Spalte in
	colorcolumn = "100", -- Blende eine Spalte bei 100 Zeichen ein
	completeopt = "menu,menuone,noselect",
	termguicolors = true,
	background = "dark",
	updatetime = 300, -- faster completion (4000ms default)
	cursorline = true,

	-- wrap = false,       -- Nicht visuell einrücken
	-- linebreak = true,
}

for k, v in pairs(sets) do
	vim.opt[k] = v
end

vim.g.mapleader = " " -- Leerzeichen als Leader verwenden
