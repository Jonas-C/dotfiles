return {
	"NeogitOrg/neogit",
	lazy = true,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
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
