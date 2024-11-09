return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	enabled = true,
	opts = {
		-- bigfile = { enabled = true },
		notifier = {
			enabled = false,
			timeout = 3000,
		},
		-- quickfile = { enabled = false },
		-- statuscolumn = { enabled = false },
		-- words = { enabled = false },
	},

	keys = {
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Blame Line",
		},
	},
}
