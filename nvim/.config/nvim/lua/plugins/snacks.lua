return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	enabled = true,
	opts = {
		-- quickfile = { enabled = false },

		-- words = { enabled = false },
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
