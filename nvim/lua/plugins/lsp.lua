return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		cond = not vim.g.vscode,
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			"jose-elias-alvarez/typescript.nvim",
			{
				"b0o/schemastore.nvim",
				lazy = false,
			},
		},
		config = function()
			return require("lsp").setup()
		end,
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		config = true,
	},
	{
		"folke/neodev.nvim",
		opts = {
			experimental = { pathStrict = true },
		},
	},
}
