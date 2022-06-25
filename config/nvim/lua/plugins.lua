require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Themes
  use("folke/tokyonight.nvim")
  use("andersevenrud/nordic.nvim")

  --  LSP
  use({
  	"williamboman/nvim-lsp-installer",
  	"neovim/nvim-lspconfig",
  })

  -- Autocompletion
  use({
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
  })

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  --  Telescope
  use({
  	"nvim-telescope/telescope.nvim",
	requires = { {"nvim-lua/plenary.nvim"} }
  })
end)

-- Configure colorscheme
require("nordic").colorscheme({
    underline_option = "none",
    italic = true,
    italic_comments = false,
    minimal_mode = false,
    alternate_backgrounds = true 
})

-- Configure Nvim LSP Intaller
require("nvim-lsp-installer").setup{
	automatic_installation = true	
}

-- Configure Syntax Hightlighting
require("nvim-treesitter.configs").setup({
	ensure_insatlled = "maintainted",
	sync_install = false,
	additional_vim_regex_highlighting = false,
	ignore_install = { },
	highlight = {
		enable = true,
		diable = { },
	},
})

-- Configure CMP (autocompletion)
local cmp = require("cmp")
cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
    })
  })
