return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = "all",
			indent = {
				enable = false,
			},
			autotag = {
				enable = true,
			},
			highlight = {
				enable = not vim.g.vscode,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = true,
	},
}
