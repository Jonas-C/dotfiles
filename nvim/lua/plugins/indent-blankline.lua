return {
	"lukas-reineke/indent-blankline.nvim",
	cond = not vim.g.vscode,
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		char = "│",
		filetype_exclude = { "help", "neo-tree", "lazy" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
	},
}
