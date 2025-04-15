return {
	"windwp/nvim-autopairs",
	event = "VeryLazy",
	opts = {
		check_ts = true,
		disable_filetype = { "grug-far", "grug-far-history", "snacks_picker_input" },
		ts_config = { java = false },
		enable_close_on_slash = false,
	},
}
