return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"RRethy/nvim-treesitter-endwise",
				ft = { "bash", "lua" },
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "mlir" },
				indent = {
					enable = false,
				},
				endwise = { enable = true },
				autotag = {
					enable = true,
				},
				highlight = {
					enable = not vim.g.vscode,
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
}
