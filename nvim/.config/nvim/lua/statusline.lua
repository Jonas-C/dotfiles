local cached_tmux_windows = ""

local calculate_tmux_windows = function()
	local res = vim.fn.systemlist('tmux list-windows -F "#{window_index}: #{window_name}#{?window_active,*,}"')
	local result = ""
	for _, window in ipairs(res) do
		local window_number, window_name, active_flag = window:match("^(%d+):%s*(.-)%s*(%*?)$")
		if window_number == nil then break end
		local is_active = active_flag == "*"
		local hl_group = is_active and "%#LualineTmuxWindowActive#" or "%#LualineTmuxWindowInactive#"
		result = result .. hl_group .. " " .. window_number .. " %#StatusLine# " .. window_name .. "  "
	end
	return result
end

vim.api.nvim_create_autocmd("FocusGained", {
	group = vim.api.nvim_create_augroup("StatuslineTmux", { clear = true }),
	callback = function()
		local res = calculate_tmux_windows()
		if res ~= cached_tmux_windows then
			cached_tmux_windows = res
			vim.cmd("redrawstatus!")
		end
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	group = vim.api.nvim_create_augroup("StatuslineGitSigns", { clear = true }),
	command = "redrawstatus!",
})

cached_tmux_windows = calculate_tmux_windows()

local calculate_git = function()
	local status = vim.b.gitsigns_status_dict
	if status == nil then
		return ""
	end

	local parts = {}

	if (status.added or 0) > 0 then
		table.insert(parts, "%#GitSignsAdd#+" .. status.added)
	end
	if (status.changed or 0) > 0 then
		table.insert(parts, "%#GitSignsChange#~" .. status.changed)
	end
	if (status.removed or 0) > 0 then
		table.insert(parts, "%#GitSignsDelete#-" .. status.removed)
	end

	table.insert(parts, "%#StatusLine# " .. " " .. (status.head or ""))

	return table.concat(parts, "%#StatusLine# ") .. "%#StatusLine# "
end

local last_render = ""

local should_skip = function()
	local ft = vim.bo.filetype
	local bt = vim.bo.buftype
	return ft == "neo-tree" or bt == "terminal" or vim.startswith(ft, "snacks_picker")
end

return {
	render = function()
		if should_skip() then
			return last_render
		end
		last_render = table.concat({
			cached_tmux_windows,
			"%=",
			calculate_git(),
		})
		return last_render
	end,
}
