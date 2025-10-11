return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 1000, lsp_fallback = true }
		end,
		notify_on_error = true,
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			["javascript"] = { "biome", "prettierd", "prettier" },
			["javascriptreact"] = { "biome", "prettierd", "prettier" },
			["typescript"] = { "biome", "prettierd", "prettier" },
			["typescriptreact"] = { "biome", "prettierd", "prettier" },
			["vue"] = { "prettierd", "prettier" },
			["css"] = { "prettierd", "prettier" },
			["scss"] = { "prettierd", "prettier" },
			["less"] = { "prettierd", "prettier" },
			["html"] = { "prettierd", "prettier" },
			["json"] = { "biome", "prettierd", "prettier" },
			["jsonc"] = { "biome", "prettierd", "prettier" },
			["yaml"] = { "prettierd", "prettier" },
			["markdown"] = { "prettierd", "prettier" },
			["markdown.mdx"] = { "prettierd", "prettier" },
			["graphql"] = { "biome", "prettierd", "prettier" },
			["handlebars"] = { "prettierd", "prettier" },
			["python"] = { "ruff-lsp" },
			["rust"] = { "rustfmt" },
			["go"] = { "goimports", "gofumpt" },
			["toml"] = { "taplo" },
		},
		config = function(opts)
			require("conform").setup(opts)
		end,
	},
}
