function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
return {
	"akinsho/toggleterm.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	opts = {
		direction = "tab",
		size = 60,
		insert_mappings = false,
		open_mapping = [[<leader>+]],
		float_opts = {
			border = "curved",
		},
	},
}
