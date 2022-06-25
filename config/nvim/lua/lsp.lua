local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
 	--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  	--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  	--vim.keymap.set('n', '<space>wl', function()
   --		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  	--end, bufopts)
  	--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  	--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  	--vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").gopls.setup{
	on_attach = on_attach,
	capabilites = capabilities,
}

require("lspconfig").marksman.setup{
	on_attach = on_attach
}

require("lspconfig").elixirls.setup{
	on_attach = on_attach,
	cmd = { "/home/maik/.local/share/nvim/lsp_servers/elixirls/elixir-ls/language_server.sh" },
}
