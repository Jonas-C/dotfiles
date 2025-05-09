return {
	"mason-org/mason.nvim",
	lazy = false,
	config = function()
		require("mason").setup({
			ui = { border = "rounded", backdrop = 100 },
		})
	end,
}
