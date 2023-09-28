return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	cond = not vim.g.vscode,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("ibl").setup({
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
					"lazy",
					"neo-tree",
					"toggleterm",
					"lazy",
					"mason",
				},
			},
		})
	end,
}
