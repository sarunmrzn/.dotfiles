return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
	},
	config = function()
		require("neo-tree").setup({
			use_libuv_file_watcher = true,
			filesystem = {
				window = {
					mappings = {
						["\\"] = "close_window",
					},
				},
				filtered_items = {
					hide_dotfiles = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
			sort_function = function(a, b)
				if a.type ~= b.type then
					return a.type < b.type
				end
				local a_name = a.path:match("v(%d+)")
				local b_name = b.path:match("v(%d+)")

				if a_name and b_name then
					return tonumber(a_name) < tonumber(b_name)
				else
					return a.path < b.path
				end
			end,
		})
	end,
}
