return {
	"nvim-neorg/neorg",
	lazy = false,
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.export"] = {},
			-- This is required for now, breaks on nightly
			["core.esupports.metagen"] = { config = { update_date = false } },
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
