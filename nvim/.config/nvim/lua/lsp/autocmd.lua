local group = vim.api.nvim_create_augroup("lsp", {})

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local bufnr = args.buf
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
	end,
})
