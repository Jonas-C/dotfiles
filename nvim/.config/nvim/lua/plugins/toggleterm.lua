-- Close Terminal and open buffer in "normal window".
-- https://github.com/akinsho/toggleterm.nvim/issues/116
local function go_to_file()
	local toggleterm = require("toggleterm")
	local cursor = vim.api.nvim_win_get_cursor(0)
	local bufnr = vim.api.nvim_get_current_buf()
	toggleterm.toggle(0)
	vim.api.nvim_win_set_buf(0, bufnr)
	vim.api.nvim_win_set_cursor(0, cursor)
	vim.cmd("norm! gf")
end

vim.api.nvim_create_augroup("ToggleTerm", {})
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*toggleterm#*",
	callback = function()
		vim.keymap.set("n", "gf", go_to_file, { buffer = true })
		-- Normal mode in terminal
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = true })
	end,
	group = "ToggleTerm",
})

return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	opts = {
		direction = "float",
		size = 60,
		insert_mappings = false,
		start_in_insert = true,
		open_mapping = [[<leader>+]],
		float_opts = {
			border = "curved",
		},
	},
}
