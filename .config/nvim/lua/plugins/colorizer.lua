return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*", -- Apply to all file types
			}, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- Disable color names like "blue"
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- Enable rgb() and rgba() functions
				hsl_fn = true, -- Enable hsl() and hsla() functions
				css = true, -- Enable all CSS color values
				css_fn = true, -- Enable all CSS functions
				mode = "background", -- Set display mode: "foreground", "background" or "virtualtext"
			})
		end,
	},
}
