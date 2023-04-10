return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		cond = not vim.g.vscode,
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			"jose-elias-alvarez/typescript.nvim",
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
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		lazy = true,
		config = true,
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
