vim.api.nvim_set_keymap(
	"n",
	"<leader>y",
	"<cmd>lua require('package-info').change_version()<cr>",
	{ silent = true, noremap = true }
)

return {
	"vuki656/package-info.nvim",
	cond = not vim.g.vscode,
	lazy = false,
	version = false,
	config = function()
		require("package-info").setup({
			autostart = true,
			hide_unstable_versions = true,
			package_manager = "yarn",
		})
	end,
}
