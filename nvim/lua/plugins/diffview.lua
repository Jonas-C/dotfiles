function DiffviewToggle()
	local lib = require("diffview.lib")
	local view = lib.get_current_view()
	if view then
		-- Current tabpage is a Diffview; close it
		vim.cmd(":DiffviewClose")
	else
		-- No open Diffview exists: open a new one
		vim.cmd(":DiffviewOpen")
	end
end

return {
	"sindrets/diffview.nvim",
	version = false,
	cond = not vim.g.vscode,
	keys = {
		{ "<Leader>gg", ":lua DiffviewToggle()<cr>", { desc = "Show git diff" } },
	},
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggle",
		"DiffviewFocusFiles",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	opts = {
		enhanced_diff_hl = true,
	},
}
