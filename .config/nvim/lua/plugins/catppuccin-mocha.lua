return {
	{ "catppuccin/nvim", name = "catppuccin",
		priority = 1000,

		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			flavour = "mocha",
			-- flavour = "latte",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
		},
	},
}
