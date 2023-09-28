local M = {}

--- Returns true when the provided string ends with the provided ending
--- @param str string
--- @param ending string
M.ends_with = function(str, ending)
	return ending == "" or string.sub(str, -#ending) == ending
end

function M.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

return M
