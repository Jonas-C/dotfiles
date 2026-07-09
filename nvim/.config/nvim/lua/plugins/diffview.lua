return {
	"dlyongemallo/diffview-plus.nvim",
	version = false,
	lazy = true,
	keys = {
		{ "<Leader>gg", "<cmd>DiffviewToggle<cr>", { desc = "Show git diff" } },
	},
	opts = {
		enhanced_diff_hl = true,
	},
}
