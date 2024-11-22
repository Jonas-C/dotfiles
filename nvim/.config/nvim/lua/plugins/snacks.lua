return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	enabled = true,
	opts = {
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},

	keys = {
		{
			"<leader>gbr",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Blame Line",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
	},
}
