return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {

		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				opts = { skip = true },
			},
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
		lsp = {
			hover = {
				silent = true,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				-- TODO: Disable this when switching off nvim-cmp
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
