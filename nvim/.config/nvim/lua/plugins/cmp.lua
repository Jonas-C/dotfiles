return {
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local data = entry.completion_item.data
						if data and data.entryNames and data.entryNames[1] and data.entryNames[1].data then
							vim_item.menu = data.entryNames[1].data.moduleSpecifier
						end
						local kind =
							require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						return vim_item
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-f>"] = cmp.mapping.scroll_docs(-4),
					["<CR>"] = function(fallback)
						if cmp.core.view:visible() or vim.fn.pumvisible() == 1 then
							if cmp.confirm({ select = true }) then -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
								return
							end
						end
						return fallback()
					end,
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
			}
		end,
	},
}
