return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	enabled = true,
	opts = {
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = {
			-- TODO: Disable this for now. Need to figure out whether I want the extra spacing to the right of the statusline.
			enabled = false,
		},
		words = { enabled = true },
		indent = {
			enabled = true,
			-- blank = "ø",
			char = "│",
			animate = {
				enabled = false,
			},
		},
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
