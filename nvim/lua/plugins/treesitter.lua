return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		-- cond = not vim.g.vscode,
		version = false,
		event = "BufReadPost",
		dependencies = {
			{
				"RRethy/nvim-treesitter-endwise",
				ft = { "bash", "lua" },
			},
			"HiPhish/nvim-ts-rainbow2",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			-- Parser for styled components until tree-sitter supports it directly.
			-- parser_config.styled = {
			-- 	install_info = {
			-- 		url = "https://github.com/mskelton/tree-sitter-styled",
			-- 		branch = "main",
			-- 		files = { "src/parser.c", "src/scanner.c" },
			-- 		generate_requires_npm = true,
			-- 	},
			-- 	maintainers = { "@mskelton" },
			-- }
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "mlir" },
				indent = {
					enable = true,
				},
				-- matchup = {
				-- 	enable = true,
				-- },
				endwise = { enable = true },
				autotag = {
					enable = true,
				},
				highlight = {
					enable = not vim.g.vscode,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = true,
				},
				rainbow = {
					enable = true,
					hlgroups = {
						"TSRainbowYellow",
						"TSRainbowViolet",
						"TSRainbowCyan",
					},
					-- extended_mode = false,
					-- termcolors = {},
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})

			-- Custom predicate to improve highlighting of languages injected into JS
			-- tagged template literals.
			--
			-- vim.treesitter.query.add_predicate("injected?", function(match, _, bufnr, pred)
			-- 	local node = match[pred[2]]
			-- 	local ancestor_types = { unpack(pred, 3) }
			--
			-- 	if not node then
			-- 		return false
			-- 	end
			--
			-- 	local parent = node:parent()
			-- 	if parent:type() == "call_expression" then
			-- 		local func = parent:field("function")[1]
			-- 		local name_node = nil
			--
			-- 		if func:type() == "identifier" then
			-- 			name_node = func
			-- 		elseif func:type() == "call_expression" then
			-- 			name_node = func:field("function")[1]
			-- 		elseif func:type() == "member_expression" then
			-- 			name_node = func:field("object")[1]
			-- 		end
			--
			-- 		return name_node ~= nil
			-- 			and vim.tbl_contains(ancestor_types, vim.treesitter.get_node_text(name_node, bufnr))
			-- 	end
			--
			-- 	return false
			-- end, true)
		end,
	},
	{
		"nvim-treesitter/playground",
		event = "VeryLazy",
	},
	-- {
	-- 	"andymass/vim-matchup",
	-- 	config = function()
	-- 		vim.g.matchup_matchparen_offscreen = { method = "popup" }
	-- 	end,
	-- },
}
