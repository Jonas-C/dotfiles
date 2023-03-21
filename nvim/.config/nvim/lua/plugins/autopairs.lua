return {
	"echasnovski/mini.pairs",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	config = function(_, opts)
		require("mini.pairs").setup(opts)
	end,
}
