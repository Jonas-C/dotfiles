return {
	"stevearc/dressing.nvim",
	lazy = true,
	cond = not vim.g.vscode,
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.select(...)
		end
	end,
}
