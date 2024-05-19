return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"pmizio/typescript-tools.nvim",
			"nvimtools/none-ls.nvim",
			"yioneko/nvim-vtsls",
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
	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
	},
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	{ "dmmulroy/ts-error-translator.nvim", lazy = true, config = true },
}
