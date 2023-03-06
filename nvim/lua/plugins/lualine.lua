return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		icons_enabled = true,
		options = {
			disabled_filetypes = { "neo-tree" },
		},
		theme = "auto",
		component_separators = "|",
		section_separators = { left = "", right = "" },
		always_divide_middle = true,
		globalstatus = false,
		sections = {
			lualine_a = { "mode" },
			lualine_b = {},
			lualine_c = {
				{
					"diagnostics",
					sections = { "error", "warn", "info", "hint" },
					always_visible = true,
				},
			},
			lualine_x = { "none" },
			lualine_y = { "branch", "diff" },
			lualine_z = {},
		},
		extensions = { "neo-tree" },
	},
}
