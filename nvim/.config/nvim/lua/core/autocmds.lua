local augroup = function(name)
	return vim.api.nvim_create_augroup("tvl_" .. name, { clear = true })
end

-- Do not automatically comment newlines. Caused by ftplugin
vim.api.nvim_create_autocmd("FileType", { command = "set formatoptions-=o" })

-- Set conceallevel when entering a norg file. Enables fancy neorg functionality.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, { pattern = { "*.norg" }, command = "set conceallevel=3" })
--
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"startuptime",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
