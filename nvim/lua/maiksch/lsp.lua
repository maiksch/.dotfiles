local cmp = require('cmp') 

cmp.setup({
    snippet = {
        expand = function(args)
			-- For `luasnip` users.
            require('luasnip').lsp_expand(args.body) 
        end,
    },

    window = {
		-- completion = cmp.config.window.bordered(),
      	-- documentation = cmp.config.window.bordered(),
    },

    mapping = {
      	['<C-b>'] = cmp.mapping.scroll_docs(-4), 
		['<C-f>'] = cmp.mapping.scroll_docs(4),
      	['<C-Space>'] = cmp.mapping.complete(),
      	['<C-b>'] = cmp.mapping.scroll_docs(-4),
      	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    sources = {
      	{ name = 'nvim_lsp' },
		
		-- For luasnip users.
      	{ name = 'luasnip' }, 

      	{ name = 'buffer' },
    }
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("gD", ":lua vim.lsp.buf.declaration()<CR>")
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
		--	Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
		--	Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
		--	Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
		--	Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
		--	Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
		--	Nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
		--	Nnoremap("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
		--	Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

require("nvim-lsp-installer").setup {}

-- Docker
require("lspconfig").dockerls.setup(config())

-- C#
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/maiksch/.cache/omnisharp-vim/omnisharp-roslyn/run"
require("lspconfig").omnisharp.setup(config({
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}))

-- Svelte
require("lspconfig").svelte.setup(config())

-- JavaScript / Typescript
require("lspconfig").tsserver.setup(config())
