return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"petertriho/nvim-scrollbar",
	},
	lazy = false,
	cond = not vim.g.vscode,
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			sign_priority = 0,
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		})
		require("scrollbar").setup({
			handle = {
				color = "#737aa2",
			},
			marks = {
				Error = {
					text = { "E", "E" },
				},
				Warn = {
					text = { "W", "W" },
				},
				GitAdd = {
					text = "█",
				},
				GitChange = {
					text = "█",
				},
			},
		})
		require("scrollbar.handlers.gitsigns").setup()
	end,
}
