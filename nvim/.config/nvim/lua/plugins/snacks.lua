vim.api.nvim_create_user_command("Pickers", function()
	Snacks.picker()
end, { nargs = "*" })

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
		scope = {
			treesitter = {
				enabled = false,
			},
		},
		indent = {
			enabled = true,
			char = "│",
			animate = {
				enabled = false,
			},
		},
		win = {
			backdrop = false,
		},
		picker = {
			layout = {
				layout = {
					backdrop = false,
				},
			},
			formatters = {
				file = {
					truncate = 80,
				},
			},
			sources = {
				grep = {
					-- this hides the text match from the grep result.
					transform = function(item)
						item.line = nil
					end,
				},
			},
			win = {
				input = {
					keys = {
						["<c-tab>"] = { "list_down", mode = { "i", "n" } },
						["<c-s-tab>"] = { "list_up", mode = { "i", "n" } },
					},
				},
			},
		},
	},

	keys = {
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"<leader>e",
			function()
				Snacks.picker.explorer()
			end,
		},
		{
			"<leader>f",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>d",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Files",
		},
		{
			"<leader>re",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume previous session",
		},
		{
			"<c-tab>",
			function()
				Snacks.picker.buffers({ current = false })
			end,
			desc = "Buffers",
		},
		{
			"<leader>gbr",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open git repo",
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
