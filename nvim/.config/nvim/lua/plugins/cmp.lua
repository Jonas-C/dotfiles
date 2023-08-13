return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		cond = not vim.g.vscode,
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		version = false,
		cond = not vim.g.vscode,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			local cmp = require("cmp")
			local icons = require("core.icons")

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local data = entry.completion_item.data
						if data ~= nil and data.entryNames and data.entryNames[1] and data.entryNames[1].data then
							vim_item.menu = data.entryNames[1].data.moduleSpecifier
						end
						local kind = icons.kinds[vim_item.kind]
						if kind then
							vim_item.kind = kind
						end
						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = "select" })
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "i", "s", "c" }),
					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = "select" })
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "i", "s", "c" }),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-f>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{
						name = "buffer",
						-- Removes text entries from cmp
						entry_filter = function(entry)
							local kind = cmp.lsp.CompletionItemKind[entry:get_kind()]
							return kind ~= "Text"
						end,
					},
					{
						name = "neorg",
					},
					{
						name = "nvim_lsp",
						-- Removes <use>${1}</use> snippet
						entry_filter = function(entry, _)
							local kind = cmp.lsp.CompletionItemKind[entry:get_kind()]
							if kind == "Text" then
								return false
							elseif kind == "Snippet" then
								return false
							else
								return true
							end
						end,
					},
					{ name = "path" },
				}),
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.kind,
					},
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},
}
