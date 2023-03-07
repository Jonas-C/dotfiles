return {
	"akinsho/toggleterm.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			size = 60,
			insert_mappings = false,
			open_mapping = [[<leader>+]],
			float_opts = {
				border = "curved",
			},
		})
	end,
}
