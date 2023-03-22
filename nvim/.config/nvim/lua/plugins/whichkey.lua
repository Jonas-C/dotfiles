return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode,
	config = function()
		local wk = require("which-key")
		wk.register()
	end,
}
