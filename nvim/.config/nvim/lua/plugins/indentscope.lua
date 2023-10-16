return {
	"echasnovski/mini.indentscope",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"neo-tree",
				"lazy",
				"mason",
				"toggleterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
	config = function()
		require("mini.indentscope").setup({
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
			},
			symbol = "│",
		})
	end,
}
