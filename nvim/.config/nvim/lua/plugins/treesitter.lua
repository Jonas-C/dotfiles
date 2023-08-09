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
					enable = true,
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

			-- Custom predicate to improve highlighting of languages injected into JS
			-- tagged template literals.
			vim.treesitter.query.add_predicate("injected?", function(match, _, bufnr, pred)
				local node = match[pred[2]]
				local ancestor_types = { unpack(pred, 3) }

				if not node then
					return false
				end

				local parent = node:parent()
				if parent:type() == "call_expression" then
					local func = parent:field("function")[1]
					local name_node = nil

					if func:type() == "identifier" then
						name_node = func
					elseif func:type() == "call_expression" then
						name_node = func:field("function")[1]
					elseif func:type() == "member_expression" then
						name_node = func:field("object")[1]
					end

					return name_node ~= nil
						and vim.tbl_contains(ancestor_types, vim.treesitter.get_node_text(name_node, bufnr))
				end

				return false
			end, true)
		end,
	},
}
