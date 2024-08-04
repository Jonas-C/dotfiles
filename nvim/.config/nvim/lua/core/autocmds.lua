local augroup = function(name)
	return vim.api.nvim_create_augroup("ec" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Do not automatically comment newlines. Caused by ftplugin
vim.api.nvim_create_autocmd("FileType", { command = "set formatoptions-=o" })

-- Set conceallevel when entering a norg file. Enables fancy neorg functionality.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, { pattern = { "*.norg" }, command = "set conceallevel=3" })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- close cmdwin with <q>
-- I can live with not having macros in the cmdwin
vim.api.nvim_create_autocmd("CmdwinEnter", {
	group = augroup("close_cmdwin_with_q"),
	callback = function(event)
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
