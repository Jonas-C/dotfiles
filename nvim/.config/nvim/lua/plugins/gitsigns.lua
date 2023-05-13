return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	config = function()
		require("gitsigns").setup({
			_inline2 = true,
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
	end,
}
