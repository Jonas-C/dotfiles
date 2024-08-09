return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	opts = {
		on_attach = function(bufnr)
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end
			local gitsigns = require("gitsigns")
			map("n", "<leader>gd", gitsigns.toggle_deleted, { desc = "Toggle deleted lines" })
			map("n", "<leader>gp", gitsigns.preview_hunk_inline, { desc = "Preview hunk changes" })
			map("n", "<leader>gn", gitsigns.next_hunk, { desc = "Go to next hunk" })
			map("n", "<leader>ga", gitsigns.stage_hunk, { desc = "Go to next hunk" })
			map("n", "<leader>grh", gitsigns.reset_hunk, { desc = "Go to next hunk" })
			map("n", "<leader>grb", gitsigns.reset_buffer, { desc = "Go to next hunk" })
			map("n", "<leader>gl", gitsigns.blame_line, { desc = "Show blame line" })
		end,
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		current_line_blame = true,
		sign_priority = 0,
	},
}
