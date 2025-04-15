return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = { border = "rounded", backdrop = 100 },
		})
		require("mason-lspconfig").setup({ automatic_installation = true })
	end,
}
