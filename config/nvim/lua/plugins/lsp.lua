return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp", -- completions
		"hrsh7th/cmp-nvim-lsp",
		"RRethy/vim-illuminate", -- highlight other uses of word
	},
	config = function()
		local function keymaps(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			--vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>.", vim.lsp.buf.code_action, bufopts)

			-- Create a command `:Format` local to the LSP buffer
			-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, desc = "Format")
		end

		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local illuminate = require("illuminate")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		illuminate.configure()

		local on_attach = function(client, bufnr)
			keymaps(client, bufnr)
			illuminate.on_attach(client)
		end

		mason.setup()

		mason_lspconfig.setup {
			ensure_installed = { "gopls", "html" },
			automatic_installation = true,
			handlers = {
				function(server_name)
					lspconfig[server_name].setup {
						on_attach = on_attach,
						capabilities = capabilities,
					}
				end,
				lua_ls = function()
					lspconfig.lua_ls.setup {
						on_attach = on_attach,
						capabilites = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					}
				end,
			}
		}

		-- need to to this manually, because there is no server mapping in mason_lspconfig yet
		lspconfig.htmx.setup {
			on_attach = on_attach,
			capabilites = capabilities,
		}
	end
}
