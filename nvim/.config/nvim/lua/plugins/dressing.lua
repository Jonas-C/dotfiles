return {
	"stevearc/dressing.nvim",
	lazy = true,
	opts = {
		input = {
			mappings = {
				i = {
					["<Esc>"] = false,
					["<C-c>"] = "Close",
				},
			},
		},
	},
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.select(...)
		end
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.input = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.input(...)
		end
	end,
}
