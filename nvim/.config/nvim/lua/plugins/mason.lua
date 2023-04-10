return {
	"williamboman/mason.nvim",
	cond = not vim.g.vscode,
	lazy = true,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local index = require("mason-registry.index")
		-- Registry overrides
		index["typescript-styled-plugin"] = "mason-registry.ts-styled-plugin"
		index["typescript-plugin-css-modules"] = "mason-registry.typescript-plugin-css-modules"

		require("mason").setup({ ui = { border = "rounded" } })
		require("mason-lspconfig").setup({ automatic_installation = true })
		require("mason-null-ls").setup({ automatic_installation = true })
	end,
}
