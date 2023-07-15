return {
	"NeogitOrg/neogit",
	dependencies = "nvim-lua/plenary.nvim",
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
