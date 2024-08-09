return {
	"windwp/nvim-autopairs",
	event = "VeryLazy",
	opts = {
		check_ts = true,
		disable_filetype = { "TelescopePrompt", "grug-far", "grug-far-history" },
		ts_config = { java = false },
		enable_close_on_slash = false,
	},
}
