return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
		},
	},
}
