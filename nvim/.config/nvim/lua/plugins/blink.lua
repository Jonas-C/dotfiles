return {
	{
		"saghen/blink.cmp",
		-- lazy = true,
		version = false,
		enabled = true,
		build = "cargo build --release",
		opts = {
			keymap = {
				-- Override for Copilot
				["<C-space>"] = {},
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },

				["<C-f>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
				cmdline = {
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["tab"] = {},
					["<c-tab>"] = {},
				},
			},

			appearance = {
				kind_icons = {

					Array = " ",
					Boolean = "󰨙 ",
					Class = " ",
					Codeium = "󰘦 ",
					Color = " ",
					Control = " ",
					Collapsed = " ",
					Constant = "󰏿 ",
					Constructor = " ",
					Copilot = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Folder = " ",
					Function = "󰊕 ",
					Interface = " ",
					Key = " ",
					Keyword = " ",
					Method = "󰊕 ",
					Module = " ",
					Namespace = "󰦮 ",
					Null = " ",
					Number = "󰎠 ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					Reference = " ",
					Snippet = "󱄽 ",
					String = " ",
					Struct = "󰆼 ",
					Supermaven = " ",
					TabNine = "󰏚 ",
					Text = " ",
					TypeParameter = " ",
					Unit = " ",
					Value = " ",
					Variable = "󰀫 ",

					-- Variable = "󰆦",
					-- Constant = "󰏿",
				},
			},

			completion = {
				menu = {
					border = "rounded",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
					treesitter_highlighting = true,
					window = {
						max_width = 100,
						border = "rounded",
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
			sources = {
				-- TODO: Figure out how to disable snippets and text entirely.
				default = function()
					local node = vim.treesitter.get_node()
					if vim.bo.filetype == "lua" then
						return { "lsp", "path" }
					elseif node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
						return {}
					else
						return { "lsp", "path" }
					end
				end,
				-- transform_items = function(_, items)
				-- 	-- Remove snippet and "Text" sources from lsp autocomplete
				-- 	return vim.tbl_filter(function(item)
				-- 		return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
				-- 			or item.kind ~= vim.lsp.protocol.CompletionItemKind.Snippet
				-- 	end, items)
				-- end,
			},
		},
	},
}
