return {
	"nvim-lualine/lualine.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	opts = {
		options = {
			disabled_filetypes = { "neo-tree" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = { "neo-tree" },
	},
}
