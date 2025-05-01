return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local Terminal = require("toggleterm.terminal").Terminal

			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				direction = "float",
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = false,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				close_on_exit = true,
				shell = vim.o.shell,
				highlights = {
					Normal = {
						guibg = "NONE",
					},
					NormalFloat = {
						guibg = "NONE",
					},
					FloatBorder = {
						guifg = "NONE",
						guibg = "NONE",
					},
				},
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "None",
					},
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function()
					vim.cmd("startinsert!")
				end,
			})

			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>G",
				"<cmd>lua _LAZYGIT_TOGGLE()<CR>",
				{ noremap = true, silent = true }
			)


			local lazydocker = Terminal:new({
				cmd = "lazydocker",
				direction = "float",
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = false,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				close_on_exit = true,
				shell = vim.o.shell,
				highlights = {
					Normal = {
						guibg = "NONE",
					},
					NormalFloat = {
						guibg = "NONE",
					},
					FloatBorder = {
						guifg = "NONE",
						guibg = "NONE",
					},
				},
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "None",
					},
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function()
					vim.cmd("startinsert!")
				end,
			})

			function _LAZYDOCKER_TOGGLE()
				lazydocker:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>dd",
				"<cmd>lua _LAZYDOCKER_TOGGLE()<CR>",
				{ noremap = true, silent = true }
			)


			local posting = Terminal:new({
				cmd = "posting",
				direction = "float",
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = false,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				close_on_exit = true,
				shell = vim.o.shell,
				highlights = {
					Normal = {
						guibg = "NONE",
					},
					NormalFloat = {
						guibg = "NONE",
					},
					FloatBorder = {
						guifg = "NONE",
						guibg = "NONE",
					},
				},
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "None",
					},
				},
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
				end,
				on_close = function()
					vim.cmd("startinsert!")
				end,
			})

			function _POSTING_TOGGLE()
				posting:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>pp",
				"<cmd>lua _POSTING_TOGGLE()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
