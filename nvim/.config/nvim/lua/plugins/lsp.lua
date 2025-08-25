return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			return require("lsp")
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
	{
		"scalameta/nvim-metals",
		ft = { "scala", "sbt", "java" },
		keys = {
			{
				"<leader>mc",
				function()
					require("metals").compile_cascade()
				end,
				desc = "Metals compile cascade",
			},
			{
				"<leader>me",
				function()
					require("metals").commands()
				end,
				desc = "Metals menu",
			},
		},
		config = function()
			local metals = require("metals")
			local config = metals.bare_config()
			config.settings = {
				serverProperties = { "-Xmx8g" },
			}
			config.cmd_env = {
				MILL_OUTPUT_DIR = "out-metals",
			}
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "scala", "sbt", "java" },
				callback = function()
					metals.initialize_or_attach(config)
				end,
				group = nvim_metals_group,
			})
		end,
	},
}
