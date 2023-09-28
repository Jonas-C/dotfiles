return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		current_line_blame = true,
		sign_priority = 0,
		_inline2 = true,
	},
}
