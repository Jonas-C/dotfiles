local Util = require("util")
return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	cond = not vim.g.vscode,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	version = false,
	keys = {
		{
			"<c-tab>",
			"<cmd>Telescope buffers show_all_buffers=true sort_mru=true sort_lastused=true<cr>",
			desc = "Switch buffer",
		},
		{ "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>d", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>gf", "<cmd>Telescope git_status<cr>", desc = "Find files" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Show git branches" },
		{ "<leader>re", "<cmd>Telescope resume<cr>", desc = "Resume previous Telescope session" },
		{
			"<leader>a",
			function()
				local tb = require("telescope.builtin")
				local text = Util.getVisualSelection()
				tb.live_grep({ default_text = text })
			end,
			mode = "v",
			desc = "Search for selected text",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
			defaults = {
				file_ignore_patterns = { ".git/", "./node_modules/", "venv/" },
				mappings = {
					i = {
						["<esc>"] = false,
						["<c-tab>"] = actions.move_selection_next,
						["<c-s-tab>"] = actions.move_selection_previous,
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
						["<c-u>"] = false,
					},
					n = {
						["<c-c>"] = "close",
					},
				},
				prompt_prefix = "❯ ",
				selection_caret = "❯ ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
			},
			pickers = {
				lsp_references = {
					show_line = false,
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
