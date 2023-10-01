local ok, dap = pcall(require, "dap")
if not ok then
	return
end

-- Keymaps
vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F10>", function() dap.step_over() end)
vim.keymap.set("n", "<F11>", function() dap.step_into() end)
vim.keymap.set("n", "<F12>", function() dap.step_out() end)
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)

-- Adapter
dap.adapters.go = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = {"dap", "-l", "127.0.0.1:${port}"},
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
local ok, dapui = pcall(require, "dapui")
if not ok then
	return
end

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
