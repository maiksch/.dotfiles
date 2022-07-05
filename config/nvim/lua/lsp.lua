local ok, lsp = pcall(require, "lspconfig")
if not ok then
	return
end

local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_ok then
	return
end

local function highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function keymaps(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	--vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	--vim.keymap.set("n", "<space>wl", function()
	--		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts)
	--vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.code_action, bufopts)
	--vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<S-M-f>", vim.lsp.buf.formatting, bufopts)
end

local on_attach = function(client, bufnr)
	keymaps(client, bufnr)
	highlight_document(client)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	"angularls",
	"cssls",
	"svelte",
	"html",
	"gopls",
	"marksman",
	"ansiblels",
	"csharp_ls",
	"tailwindcss",
	"tsserver",
	"sqlls",
	"elixirls",
	"jedi_language_server",
	"sumneko_lua",
	"prismals",
}

local custom_options = {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	elixirls = {
		cmd = { "/home/maik/.local/share/nvim/lsp_servers/elixirls/elixir-ls/language_server.sh" },
	},
}

local default_options = {
	on_attach = on_attach,
	capabilites = capabilities,
}

lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local options = default_options
	if custom_options[server] then
		options = vim.tbl_deep_extend("force", custom_options[server], options)
	end
	lsp[server].setup(options)
end
