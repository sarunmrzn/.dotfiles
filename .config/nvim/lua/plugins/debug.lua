return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F1>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F2>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F3>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<F4>",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},
		{
			"<F7>",
			function()
				local dapui = require("dapui")
				if dapui then
					pcall(dapui.toggle)
				end
			end,
			desc = "Debug: See last session result.",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Setup dapui first with explicit configuration
		dapui.setup({
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "↻",
					terminate = "□",
				},
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
		})

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"js-debug-adapter",
				"node-debug2-adapter",
			},
		})

		-- Node.js adapter configuration using the correct mason API
		local mason_registry = require("mason-registry")

		-- Check if js-debug-adapter is installed and get its path
		local function get_js_debug_adapter_path()
			if mason_registry.is_installed("js-debug-adapter") then
				local pkg = mason_registry.get_package("js-debug-adapter")
				return pkg:get_install_path() .. "/js-debug/src/dapDebugServer.js"
			end
			return nil
		end

		-- Check if node-debug2-adapter is installed and get its path
		local function get_node_debug2_adapter_path()
			if mason_registry.is_installed("node-debug2-adapter") then
				local pkg = mason_registry.get_package("node-debug2-adapter")
				return pkg:get_install_path() .. "/out/src/nodeDebug.js"
			end
			return nil
		end

		-- Configure the node2 adapter (which is already working)
		local node_debug2_path = get_node_debug2_adapter_path()
		if node_debug2_path then
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { node_debug2_path },
			}
		else
			-- Fallback if mason path doesn't work
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
			}
		end

		-- Load launch.json configurations
		require("dap.ext.vscode").load_launchjs(nil, {
			["node"] = { "javascript", "typescript" },
			["node2"] = { "javascript", "typescript" },
		})

		-- Set up dap listeners with error handling
		dap.listeners.before.attach.dapui_config = function()
			pcall(dapui.open)
		end
		dap.listeners.before.launch.dapui_config = function()
			pcall(dapui.open)
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			pcall(dapui.close)
		end
		dap.listeners.before.event_exited.dapui_config = function()
			pcall(dapui.close)
		end
	end,
}
