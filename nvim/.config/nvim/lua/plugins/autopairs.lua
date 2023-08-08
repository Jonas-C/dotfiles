return {
	"windwp/nvim-autopairs",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	opts = {
		check_ts = true,
		ts_config = { java = false },
		enable_close_on_slash = false,
	},
}
