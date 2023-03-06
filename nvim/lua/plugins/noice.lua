return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			hover = {
				enabled = true,
				view = nil, -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = {}, -- merged with defaults from documentation
			},
			documentation = {
				view = "hover",
				---@type NoiceViewOptions
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["vim.diagnostics.open_float"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},
}
