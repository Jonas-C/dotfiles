return {
	"NeogitOrg/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>x", "<cmd>Neogit<cr>", { desc = "Open Neogit" } },
	},
	opts = {
		use_telescope = true,
		telescope_sorter = function()
			return require("telescope").extensions.fzf.native_fzf_sorter()
		end,
		integrations = {
			diffview = true,
		},
	},
}
