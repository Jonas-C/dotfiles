return {
	"echasnovski/mini.bufremove",
	keys = {
		{
			"<leader>q",
			function()
				require("mini.bufremove").delete(0, false)
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>Q",
			function()
				require("mini.bufremove").delete(0, true)
			end,
			desc = "Delete Buffer (Force)",
		},
	},
}
