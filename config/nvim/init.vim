call plug#begin('~/.vim/plugged')

" Theme and styling
Plug 'gruvbox-community/gruvbox'

" LSPs
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'OmniSharp/omnisharp-vim'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Other
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

lua require("maiksch")

" Options

set guicursor=i-ci-ve:hor25
set relativenumber " Relative Zeilennummern vom Cursor
set nu " Zeigt ausserdem die aktuelle Zeilennummer
set hidden " Buffer bleiben im Hintergrund offen 
set noerrorbells " Keine Fehlersounds
set tabstop=4 " Tabs haben eine Länge von 4 Zeichen
set shiftwidth=4
set smartindent " Automatisch intelligent einrücken
set undodir=~./vim/undodir
set undofile
set incsearch " Während der Suche die Ergebnisse inkrementell highlighten
set scrolloff=8 " 8 Zeilen vor Anfang und Ende der Datei scrollen
set signcolumn=yes " Blende links von den Zeilennummern eine weitere Spalte ein
set colorcolumn=80 " Blende eine Spalte um zu zeigen wo 80 Zeichen sind
set completeopt=menu,menuone,noselect

" Colors

set background=dark " Immer dark mode verwenden
colorscheme gruvbox " Benutze gruvbox als Theme
highlight Normal guibg=NONE ctermbg=NONE " Transparenter Hintergrund

" Remaps

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
