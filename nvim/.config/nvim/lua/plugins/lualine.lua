return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local tmux = require("lualine.component"):extend()
		tmux.default = {}
		local tmux_windows = {}

		local calculate_tmux_windows = function()
			local res = vim.fn.systemlist('tmux list-windows -F "#{window_index}: #{window_name}#{?window_active,*,}"')
			local result = ""
			for _, window in ipairs(res) do
				-- Match window number, name, and check for active (*)
				local window_number, window_name, active_flag = window:match("^(%d+):%s*(.-)%s*(%*?)$")
				local is_active = active_flag == "*"
				-- Use custom highlight groups
				local hl_group = is_active and "%#LualineTmuxWindowActive#" or "%#LualineTmuxWindowInactive#"
				result = result .. hl_group .. " " .. window_number .. " %#StatusLine# " .. window_name .. "  "
			end
			return result
		end

		function tmux:init(options)
			tmux.super:init(options)
			tmux_windows = calculate_tmux_windows()
			vim.api.nvim_create_autocmd("FocusGained", {
				group = vim.api.nvim_create_augroup("LualineTmuxPersistent", { clear = false }),
				desc = "Update tmux window status",
				callback = function()
					local res = calculate_tmux_windows()
					-- only update if something has changed
					if res ~= tmux_windows then
						tmux_windows = res
						require("lualine").refresh()
						vim.cmd("redrawstatus!")
					end
				end,
			})
		end

		function tmux:update_status()
			return tmux_windows or ""
		end
		-- If I ever want to remove tmux from my statusline and move branch + git status to the left I'll need this
		-- local neo_tree_shift = {
		-- 	function()
		-- 		local manager = require("neo-tree.sources.manager")
		-- 		local state = manager.get_state("filesystem")
		-- 		if state == nil or state.winid == nil then
		-- 			return ""
		-- 		end
		-- 		return string.rep(" ", vim.api.nvim_win_get_width(state.winid) - 2)
		-- 	end,
		-- 	cond = function()
		-- 		local renderer = require("neo-tree.ui.renderer")
		-- 		local manager = require("neo-tree.sources.manager")
		-- 		local exists = renderer.window_exists(manager.get_state("filesystem"))
		--
		-- 		return exists
		-- 	end,
		-- 	color = "NvimTreeNormal",
		-- }
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
				lualine_b = { { tmux, padding = 0 }, "", "" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
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
					"branch",
				},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filename" },
			},
		})
	end,
}
