return {
	"NeogitOrg/neogit",
	dependencies = { "sindrets/diffview.nvim" },
	branch = "nightly",
	lazy = true,
	keys = {
		{ "<leader>x", "<cmd>Neogit<cr>", { desc = "Open Neogit" } },
	},
	opts = {
		integrations = {
			diffview = true,
		},
		mappings = {
			finder = {
				["<c-j>"] = "Next",
				["<c-k>"] = "Previous",
			},
		},
	},
}
