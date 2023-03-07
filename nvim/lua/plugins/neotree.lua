return {
	"nvim-neo-tree/neo-tree.nvim",
	cond = not vim.g.vscode,
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		--
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ focus = true })
			end,
		},
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			enable_diagnostics = true,
			default_component_configs = {
				git_status = {
					symbols = {
						added = "A",
						modified = "M",
						deleted = "D",
						renamed = "R",
						untracked = "U",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			filesystem = {
				hijack_netrw_behavior = "open_current",
				follow_current_file = true,
				open_current = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			window = {
				position = "left",
			},
		})
		vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
	end,
}
