return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode,
	opts = {
		options = {
			indicator = {
				style = "underline",
			},
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return "(" .. count .. ")"
			end,
			truncate_names = false,
			show_buffer_close_icons = false,
			close_icon = "",
			offsets = {
				{
					filetype = "neo-tree",
					text = "🤯",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
