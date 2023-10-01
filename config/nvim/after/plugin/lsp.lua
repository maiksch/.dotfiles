local ok, lsp = pcall(require, "lspconfig")
if not ok then
	return
end

local mason_lspconfig_ok, mason = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

local function highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local function keymaps(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	--vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	--vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	--vim.keymap.set("n", "<space>wl", function()
	--		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts)
	--vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>.", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "<S-M-f>", vim.lsp.buf.formatting, bufopts)lsp
end

local on_attach = function(client, bufnr)
	keymaps(client, bufnr)
	highlight_document(client)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function get_options(options)
	return vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilites = capabilities,
	}, options or {})
end

mason.setup {
	automatic_installation = true,
}

mason.setup_handlers {
	function (server_name)
		lsp[server_name].setup(get_options())
	end,
	["lua_ls"] = function ()
		lsp.lua_ls.setup(get_options {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end
}