return {
	"NvChad/nvim-colorizer.lua",
	cond = not vim.g.vscode,
	event = "BufReadPre",
	opts = {
		filetypes = { "*", "!lazy" },
		buftype = { "*", "!prompt", "!nofile" },
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = false,
			RRGGBBAA = true,
			AARRGGBB = false,
			rgb_fn = true,
			hsl_fn = true,
			css = false,
			css_fn = true,
			mode = "background",
			virtualtext = "■",
		},
	},
}
