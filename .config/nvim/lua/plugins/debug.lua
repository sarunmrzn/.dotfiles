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
		-- Fixed toggle function with error handling
		{
			"<F7>",
			function()
				local dapui = require("dapui")
				-- Check if dapui is properly initialized
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
				"node-debug2-adapter",
			},
		})

		-- Node.js adapter configuration
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					require("mason-registry").get_package("js-debug-adapter"):get_install_path()
						.. "/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		-- Alternative adapter using node-debug2-adapter
		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = {
				require("mason-registry").get_package("node-debug2-adapter"):get_install_path()
					.. "/out/src/nodeDebug.js",
			},
		}

		-- Node.js configurations
		dap.configurations.javascript = {
			{
				name = "Launch",
				type = "pwa-node",
				request = "launch",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				name = "Launch (with arguments)",
				type = "pwa-node",
				request = "launch",
				program = "${file}",
				cwd = "${workspaceFolder}",
				args = function()
					local args_string = vim.fn.input("Arguments: ")
					return vim.split(args_string, " ")
				end,
			},
			{
				name = "Attach",
				type = "pwa-node",
				request = "attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Launch Server (nodemon)",
				type = "pwa-node",
				request = "launch",
				program = "${workspaceFolder}/server.js",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "nodemon",
				restart = true,
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
			},
			{
				name = "Launch with npm start",
				type = "pwa-node",
				request = "launch",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "npm",
				runtimeArgs = { "start" },
			},
			{
				name = "Attach to Remote",
				type = "pwa-node",
				request = "attach",
				address = "localhost",
				port = 9229,
				localRoot = "${workspaceFolder}",
				remoteRoot = "${workspaceFolder}",
			},
		}

		-- TypeScript configurations
		dap.configurations.typescript = {
			{
				name = "ts-node (launch)",
				type = "pwa-node",
				request = "launch",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "node",
				runtimeArgs = { "--loader", "ts-node/esm" },
				program = "${file}",
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
			},
			{
				name = "tsx (launch)",
				type = "pwa-node",
				request = "launch",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "tsx",
				program = "${file}",
				console = "integratedTerminal",
				internalConsoleOptions = "neverOpen",
			},
		}

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
