return {
	"mfussenegger/nvim-dap", -- debugging with DAP
	dependencies = { "rcarriga/nvim-dap-ui" },
	config = function()
		local dap = require("dap")
		local utils = require("dap.utils")

		-- Keymaps
		vim.keymap.set("n", "<F5>", function() dap.continue() end)
		vim.keymap.set("n", "<F10>", function() dap.step_over() end)
		vim.keymap.set("n", "<F11>", function() dap.step_into() end)
		vim.keymap.set("n", "<F12>", function() dap.step_out() end)
		vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)

		-- nodejs
		dap.adapters.node = {
			id = "node-terminal",
			type = "server",
			host = "127.0.0.1",
			port = "${port}",
			executable = {
				command = "js-debug-adapter",
				args = {"${port}"}
			}
		}
		dap.configurations.typescript = {
			{
				type = "node",
				request = "launch",
				name = "Launch node",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "yarn",
				runtimeArgs = {"dev"},
			},
			{
				type = "nodejs",
				request = "attach",
				name = "Attach",
				processid = utils.pick_process,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			}
		}

		-- golang
		dap.adapters.go = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
			},
		}

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}"
			},
			{
				type = "go",
				name = "Debug Test",
				request = "launch",
				program = "${file}",
				mode = "test",
			}
		}

		-- UI
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.before.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end
}
