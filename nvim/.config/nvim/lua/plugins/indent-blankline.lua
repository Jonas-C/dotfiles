return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = false,
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"neo-tree",
				"toggleterm",
				"lazy",
				"mason",
			},
		},
	},
}
