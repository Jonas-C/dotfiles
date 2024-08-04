return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local neo_tree_shift = {
			function()
				local manager = require("neo-tree.sources.manager")
				local state = manager.get_state("filesystem")
				if state == nil or state.winid == nil then
					return ""
				end
				return string.rep(" ", vim.api.nvim_win_get_width(state.winid) - 2)
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
				lualine_c = {
					{
						"diff",
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
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
