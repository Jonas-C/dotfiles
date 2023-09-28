return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"RRethy/nvim-treesitter-endwise",
				ft = { "bash", "lua" },
			},
			-- "HiPhish/nvim-ts-rainbow2",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "mlir" },
				indent = {
					enable = false,
				},
				endwise = { enable = true },
				autotag = {
					enable = true,
				},
				highlight = {
					enable = not vim.g.vscode,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				-- rainbow = {
				-- 	-- I love rainbow highlights, but they're currently breaking DiffView.nvim
				-- 	enable = false,
				-- 	hlgroups = {
				-- 		"TSRainbowYellow",
				-- 		"TSRainbowViolet",
				-- 		"TSRainbowCyan",
				-- 	},
				--
				-- 	query = {
				-- 		"rainbow-parens",
				-- 		html = "rainbow-parens",
				-- 		javascript = "rainbow-parens",
				-- 		tsx = "rainbow-blocks",
				-- 	},
				-- },
			})
		end,
	},
}
