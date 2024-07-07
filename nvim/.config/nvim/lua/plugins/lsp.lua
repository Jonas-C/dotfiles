return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"nvimtools/none-ls.nvim",
			"yioneko/nvim-vtsls",
		},
		config = function()
			return require("lsp").setup()
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"luvit-meta/library",
			},
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
	{ "pmizio/typescript-tools.nvim", keys = {} },
}
