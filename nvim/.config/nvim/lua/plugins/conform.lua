return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 1000,
		},
		notify_on_error = true,
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			["javascript"] = { { "prettierd", "prettier" } },
			["javascriptreact"] = { { "prettierd", "prettier" } },
			["typescript"] = { { "prettierd", "prettier" } },
			["typescriptreact"] = { { "prettierd", "prettier" } },
			["vue"] = { { "prettierd", "prettier" } },
			["css"] = { { "prettierd", "prettier" } },
			["scss"] = { { "prettierd", "prettier" } },
			["less"] = { { "prettierd", "prettier" } },
			["html"] = { { "prettierd", "prettier" } },
			["json"] = { { "prettierd", "prettier" } },
			["jsonc"] = { { "prettierd", "prettier" } },
			["yaml"] = { { "prettierd", "prettier" } },
			["markdown"] = { { "prettierd", "prettier" } },
			["markdown.mdx"] = { { "prettierd", "prettier" } },
			["graphql"] = { { "prettierd", "prettier" } },
			["handlebars"] = { { "prettierd", "prettier" } },
			["rust"] = { "rustfmt" },
		},
		config = function(opts)
			require("conform").setup(opts)
		end,
	},
}
