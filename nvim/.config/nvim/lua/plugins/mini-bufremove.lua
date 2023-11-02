return {
	"echasnovski/mini.bufremove",
	cond = not vim.g.vscode,
	keys = {
		{
			"<M-w>",
			function()
				require("mini.bufremove").delete(0, false)
			end,
			desc = "Delete Buffer",
		},
		{
			"<D-w>",
			function()
				require("mini.bufremove").delete(0, false)
			end,
			desc = "Delete Buffer",
		},
		{
			"<D-W>",
			function()
				require("mini.bufremove").delete(0, true)
			end,
			desc = "Delete Buffer (Force)",
		},
	},
}
