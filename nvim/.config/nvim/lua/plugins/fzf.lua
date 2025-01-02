return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	opts = function()
		local actions = require("fzf-lua.actions")
		return {
			fzf_colors = {
				true,
				bg = "-1",
				gutter = "-1",
			},
			fzf_opts = {
				["--no-scrollbar"] = true,
				["--cycle"] = true,
			},
			winopts = {
				width = 0.8,
				height = 0.8,
				row = 0.5,
				col = 0.5,
				backdrop = false,
				preview = {
					scrollchars = { "┃", "" },
				},
				treesitter = {
					enabled = true,
				},
			},
			files = {
				cwd_prompt = false,
				actions = {
					["ctrl-i"] = { actions.toggle_ignore },
					["ctrl-h"] = { actions.toggle_hidden },
				},
			},
			grep = {
				actions = {
					["ctrl-i"] = { actions.toggle_ignore },
					["ctrl-h"] = { actions.toggle_hidden },
				},
			},
		}
		-- actions = {
		-- 	buffers = {
		-- 		["<c-tab>"] = actions.select_next,
		-- 	},
		-- },
	end,
	-- init = function()
	-- 	vim.ui.select = function(...)
	-- 		require("lazy").load({ plugins = { "fzf-lua" } })
	-- 		require("fzf-lua").register_ui_select(nil)
	-- 		return vim.ui.select(...)
	-- 	end
	-- end,
	keys = {
		{ "<leader>f", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
		{ "<leader>d", "<cmd>FzfLua files<cr>", desc = "Files" },
		{ "<leader>gf", "<cmd>FzfLua git_status<cr>", desc = "Git status" },
		{ "<leader>zf", "<cmd>FzfLua spell_suggest<cr>", desc = "Spell suggest" },
		{ "<c-tab>", "<cmd>FzfLua buffers<cr>", desc = "Switch buffer" },
		-- Resume stuff
		{ "<leader>rf", "<cmd>FzfLua live_grep resume=true<cr>", desc = "Resume previous live grep" },
		{ "<leader>rd", "<cmd>FzfLua files resume=true<cr>", desc = "Resume previous file search" },
		{ "<leader>rgf", "<cmd>FzfLua git_status resume=true<cr>", desc = "Resume previous git status" },
		{ "<leader>re", "<cmd>FzfLua resume<cr>", desc = "Resume previous fzf session" },
	},
	config = function(_, opts)
		-- fzf doesn't support ctrl-tab and ctrl-shift-tab, but our terminal does. Let's map them to ctrl-j and ctrl-k
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fzf",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "t", "<c-Tab>", "<c-j>", { noremap = true, silent = true })
			end,
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fzf",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "t", "<c-s-Tab>", "<c-k>", { noremap = true, silent = true })
			end,
		})
		-- calling `setup` is optional for customization
		require("fzf-lua").setup(opts)
	end,
}
