vim.api.nvim_create_user_command("DiffviewToggle", function(e)
	local view = require("diffview.lib").get_current_view()

	if view then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen " .. e.args)
	end
end, { nargs = "*" })

return {
	"sindrets/diffview.nvim",
	version = false,
	lazy = true,
	keys = {
		{ "<Leader>gg", "<cmd>DiffviewToggle<cr>", { desc = "Show git diff" } },
	},
	opts = {
		enhanced_diff_hl = true,
	},
}
