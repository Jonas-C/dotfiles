return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"nvimtools/none-ls.nvim",
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
	{
		"scalameta/nvim-metals",
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals_config = require("metals").bare_config()
			-- metals_config.on_attach = function(client, bufnr)
			-- 	-- your on_attach function
			-- end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end,
	},
}
