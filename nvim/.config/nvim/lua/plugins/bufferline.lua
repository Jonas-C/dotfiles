return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode,
	opts = {
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
				separator = "▏",
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = opts,
		})
	end,
}
