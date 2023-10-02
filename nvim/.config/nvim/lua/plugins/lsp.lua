return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		cond = not vim.g.vscode,
		dependencies = {
			"pmizio/typescript-tools.nvim",
			"nvimtools/none-ls.nvim",
			{
				"b0o/schemastore.nvim",
				lazy = true,
			},
		},
		config = function()
			return require("lsp").setup()
		end,
	},
	{
		"folke/neodev.nvim",
		lazy = true,
		opts = {
			experimental = { pathStrict = true },
		},
	},
	{ "simrat39/rust-tools.nvim" },
}
