local null_ls = require("null-ls")

null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"svg",
			},
		}),
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylua,
	},
})