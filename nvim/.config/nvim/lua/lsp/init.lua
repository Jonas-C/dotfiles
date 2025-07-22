-- local methods = vim.lsp.protocol.Methods

--- Sets up LSP keymaps and autocommands for the given buffer.
---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
	local opts = { buffer = bufnr, silent = true }
	vim.keymap.set("n", "L", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "gp", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gn", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end)
	vim.keymap.set("n", "gp", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end)

	if client:supports_method("textDocument/linkedEditingRange") then
		vim.lsp.linked_editing_range.enable(true, { client_id = client.id })
	end
	-- if client:supports_method(methods.textDocument_documentHighlight) then
	-- 	local under_cursor_highlights_group = vim.api.nvim_create_augroup("mariasolos/cursor_highlights", { clear = false })
	-- 	vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
	-- 		group = under_cursor_highlights_group,
	-- 		desc = "Highlight references under the cursor",
	-- 		buffer = bufnr,
	-- 		callback = vim.lsp.buf.document_highlight,
	-- 	})
	-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
	-- 		group = under_cursor_highlights_group,
	-- 		desc = "Clear highlight references",
	-- 		buffer = bufnr,
	-- 		callback = vim.lsp.buf.clear_references,
	-- 	})
	-- end
end

for name, icon in pairs(require("core.icons").diagnostics) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	signs = false,
	severity_sort = true,
	float = {
		border = "rounded",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Configure LSP keymaps",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- I don't think this can happen but it's a wild world out there.
		if not client then
			return
		end

		on_attach(client, args.buf)
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		local server_configs = vim
			.iter(vim.api.nvim_get_runtime_file("after/lsp/*.lua", true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()
		vim.lsp.enable(server_configs)
	end,
})
