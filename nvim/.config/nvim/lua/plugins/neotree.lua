return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "main",
	cmd = "Neotree",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ focus = true })
			end,
		},
		{
			"<leader>rr",
			function()
				require("neo-tree.command").execute({ reveal = true })
			end,
		},
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		require("neo-tree").setup({
			enable_normal_mode_for_inputs = true,
			enable_diagnostics = true,
			default_component_configs = {
				file_size = { enabled = false },
				type = { enabled = false },
				last_modified = { enabled = false },
				created = { enabled = false },
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					default = " ",
				},
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
				window = {
					mappings = {
						["f"] = "telescope_find",
						["O"] = {
							function(state)
								vim.ui.open(state.tree:get_node().path)
							end,
						},
						["Y"] = {
							function(state)
								local node = state.tree:get_node()
								local path = node:get_id()
								vim.fn.setreg("+", path, "c")
							end,
						},
					},
				},
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
				follow_current_file = {
					enabled = false,
					leave_dirs_open = true,
				},
				-- group_empty_dirs = true,
				open_current = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				commands = {
					telescope_find = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						if node.type ~= "directory" then
							path = node:get_parent_id()
						end
						require("telescope.builtin").live_grep({ search_dirs = { path } })
					end,
				},
			},
			window = {
				position = "left",
				mappings = {
					["<space>"] = false,
				},
			},
		})
		vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
	end,
}
