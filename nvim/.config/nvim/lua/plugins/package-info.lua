vim.api.nvim_set_keymap(
	"n",
	"<leader>y",
	"<cmd>lua require('package-info').update()<cr>",
	{ silent = true, noremap = true }
)

return {
	"vuki656/package-info.nvim",
	cond = not vim.g.vscode,
	lazy = false,
	version = false,
	config = function()
		require("package-info").setup({
			autostart = false,
			hide_unstable_versions = true,
			hide_up_to_date = true,
			package_manager = "yarn",
		})
	end,
}
