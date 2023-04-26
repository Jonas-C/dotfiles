return {
	"williamboman/mason.nvim",
	cond = not vim.g.vscode,
	lazy = true,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		require("mason").setup({
			registries = {
				"lua:local-registry",
				"github:mason-org/mason-registry",
			},
			ui = { border = "rounded" },
		})
		require("mason-lspconfig").setup({ automatic_installation = true })
		require("mason-null-ls").setup({ automatic_installation = true })
	end,
}
