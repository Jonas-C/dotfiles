local M = {}
--
---@type PluginLspKeys
M._keys = nil

function M.get()
  ---@class PluginLspKeys
  -- stylua: ignore
  M._keys = M._keys or {
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
    { "gr", "<cmd>Telescope lsp_references show_line=false<cr>", desc = "References" },
    { "<leader>k", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>l", vim.diagnostic.open_float, desc = "Diagnostics" },
    { "<leader>nd", M.diagnostic_goto(true), desc = "Next Diagnostic" },
    { "<leader>Nd", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
    { "<leader>ne", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
    { "<leader>Ne", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
    { "<leader>nw", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
		{ "<leader>Nw", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
    { "<leader>.", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
    { "<leader>cr", M.rename, expr = true, desc = "Rename", has = "rename" },
  }
	return M._keys
end

function M.on_attach(client, buffer)
	local Keys = require("lazy.core.handler.keys")
	local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

	for _, value in ipairs(M.get()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end

	for _, keys in pairs(keymaps) do
		if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
			local opts = Keys.opts(keys)
			---@diagnostic disable-next-line: no-unknown
			opts.has = nil
			opts.silent = true
			opts.buffer = buffer
			vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
		end
	end
end

function M.rename()
	if pcall(require, "inc_rename") then
		return ":IncRename " .. vim.fn.expand("<cword>")
	else
		vim.lsp.buf.rename()
	end
end

function M.diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

return M
