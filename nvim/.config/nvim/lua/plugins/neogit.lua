return {
	"NeogitOrg/neogit",
	dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
	lazy = true,
	keys = {
		{ "<leader>x", "<cmd>Neogit<cr>", { desc = "Open Neogit" } },
	},
	opts = {
		use_telescope = true,
		-- There's currently a bug that breaks neogit when used with noice. Disable confirmation for now.
		disable_commit_confirmation = true,
		telescope_sorter = function()
			return require("telescope").extensions.fzf.native_fzf_sorter()
		end,
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
