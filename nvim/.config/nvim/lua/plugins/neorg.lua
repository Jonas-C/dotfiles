return {
	"nvim-neorg/neorg",
	ft = "norg",
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.completion"] = {
				config = {

					engine = "nvim-cmp",
				},
			},
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/notes",
					},
				},
			},
		},
	},
	dependencies = { { "nvim-lua/plenary.nvim" } },
}
