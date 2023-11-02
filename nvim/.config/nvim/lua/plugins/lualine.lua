return {
	"nvim-lualine/lualine.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	config = function()
		local neo_tree_shift = {
			function()
				local manager = require("neo-tree.sources.manager")
				local state = manager.get_state("filesystem")
				if state == nil or state.winid == nil then
					return ""
				end
				return string.rep(" ", vim.api.nvim_win_get_width(state.winid) - 1)
			end,
			cond = function()
				local renderer = require("neo-tree.ui.renderer")
				local manager = require("neo-tree.sources.manager")
				local exists = renderer.window_exists(manager.get_state("filesystem"))

				return exists
			end,
			color = "NvimTreeNormal",
		}
		require("lualine").setup({
			options = {
				globalstatus = true,
				theme = "catppuccin",
				ignore_focus = { "neo-tree" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {},
				lualine_b = { neo_tree_shift, "branch" },
				lualine_c = { "diff" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "filename" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filename" },
			},
			extensions = { "neo-tree" },
		})
	end,
}
