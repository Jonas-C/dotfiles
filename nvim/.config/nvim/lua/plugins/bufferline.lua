return {
	"akinsho/bufferline.nvim",
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
				highlight = "NeoTreeNormal",
				text_align = "left",
				-- Not showing the separator removes an awkward gap between neotree and the first buffer
				-- separator = "▏",
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup({
			highlights = require("catppuccin.special.bufferline").get_theme(),
			options = opts,
		})
	end,
}
