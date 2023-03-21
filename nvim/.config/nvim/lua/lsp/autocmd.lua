local group = vim.api.nvim_create_augroup("lsp", {})

local formatters = {
	-- "eslint",
	"null-ls",
	-- "stylelint_lsp",
}

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local opts = { buffer = bufnr, silent = true }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "L", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_definitions<cr>", opts)
		vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ge", vim.diagnostic.goto_next)

		-- Only enable formatting for specific LSP's. Many LSPs that have built-in
		-- formatting don't have robust enough formatting (e.g. tsserver is not as
		-- complete as Prettier).
		local format = vim.tbl_contains(formatters, client.name)
		client.server_capabilities.documentFormattingProvider = format
		client.server_capabilities.documentRangeFormattingProvider = format
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	callback = function(opts)
		local clients = vim.lsp.get_active_clients({ bufnr = opts.buf })

		-- Only run formatting if there are connected LSP clients
		if vim.tbl_count(clients) ~= 0 then
			vim.lsp.buf.format({
				bufnr = opts.bufnr,
				timeout = 2000,
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		end
	end,
})
