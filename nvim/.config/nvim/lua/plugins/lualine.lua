return {
	"nvim-lualine/lualine.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	opts = {
		options = {
			theme = "catppuccin",
			disabled_filetypes = { "neo-tree" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {},
			lualine_b = { "branch" },
			lualine_c = { "diff" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "filename" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "filename" },
		},
		extensions = { "neo-tree" },
	},
}
