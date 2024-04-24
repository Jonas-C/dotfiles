return {
	"NeogitOrg/neogit",
	branch = "nightly",
	lazy = true,
	keys = {
		{ "<leader>x", "<cmd>Neogit<cr>", { desc = "Open Neogit" } },
	},
	opts = {
		mappings = {
			finder = {
				["<c-j>"] = "Next",
				["<c-k>"] = "Previous",
			},
		},
	},
}
