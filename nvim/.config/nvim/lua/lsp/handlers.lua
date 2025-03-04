--- @diagnostic disable: duplicate-set-field
local M = {}
local utils = require("util")

--- Normalize a location to a uri and range
--- @param location table
M.normalize_location = function(location)
	return {
		uri = location.uri or location.targetUri,
		range = location.range or location.targetSelectionRange,
	}
end

M.register_handlers = function()
	local definition = vim.lsp.handlers["textDocument/definition"]
	local references = vim.lsp.handlers["textDocument/references"]

	-- When there are multiple results on the same line for a definition, only
	-- show the first one. This prevents many times where going to definition
	-- opens a quickfix list when it really doesn't need to.
	vim.lsp.handlers["textDocument/definition"] = function(_, result, ...)
		if vim.islist(result) then
			local ignored_paths = {
				"react/index.d.ts",
				"components/createStyleContext.tsx",
				"styled-system/types/jsx.d.ts",
				"node_modules/@ndla/styled-system/types/jsx.d.ts",
				"styled-system/lib/types/jsx.d.ts",
				"types/jsx.d.ts",
			}

			for key, value in ipairs(result) do
				for _, ignored_path in pairs(ignored_paths) do
					-- If textDocument/definition returns more than one result, remove any result contained within ignored_paths.
					if #result ~= 1 and utils.ends_with(value.targetUri, ignored_path) then
						table.remove(result, key)
					end
				end
			end
		end

		-- Defer to the built-in handler after filtering the results
		definition(_, result, ...)
	end

	-- Language servers often include the current line in find references calls
	-- which is really unnecessary since I know there is a reference where my
	-- cursor is. This filters out the current line before sending the results to
	-- the quickfix list.
	vim.lsp.handlers["textDocument/references"] = function(_, result, ...)
		if vim.islist(result) then
			local cursor_line = unpack(vim.api.nvim_win_get_cursor(0))

			result = vim.tbl_filter(function(item)
				local location = M.normalize_location(item)
				local line = location.range.start.line + 1

				return line ~= cursor_line
			end, result)
		end

		-- Defer to the built-in handler after filtering the results
		references(_, result, ...)
	end
end

return M
