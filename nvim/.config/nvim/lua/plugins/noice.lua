return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	cond = not vim.g.vscode,
	opts = {
		-- cmdline = {
		-- 	enabled = true,
		-- },
		-- popupmenu = {
		-- 	enabled = true,
		-- },
		-- notify = {
		-- 	enabled = true,
		-- },
		-- lsp = {
		-- 	progress = {
		-- 		enabled = true,
		-- 	},
		-- },
		views = {
			notify = {
				enabled = false,
			},
		},
		lsp = {
			progress = {
				-- This messes up formatting at times
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
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
