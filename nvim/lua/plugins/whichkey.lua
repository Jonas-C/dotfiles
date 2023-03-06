return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.register({
			["<C-j>"] = {"5j", "[NAVIGATION] Go down 5 lines"},
			["<C-k>"] = {"5k", "[NAVIGATION] Go up 5 lines"},

		})
	end

}
