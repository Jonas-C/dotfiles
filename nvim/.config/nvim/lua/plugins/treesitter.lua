return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		version = false,
	},
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},
}
