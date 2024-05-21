return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = "all",
			indent = { enable = true },
			highlight = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},
}
