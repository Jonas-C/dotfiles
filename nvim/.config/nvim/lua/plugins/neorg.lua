return {
	"nvim-neorg/neorg",
	ft = "norg",
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.export"] = {},
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
}
