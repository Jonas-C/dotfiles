return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		cond = not vim.g.vscode,
		dependencies = {
			"jose-elias-alvarez/typescript.nvim",
			{
				"folke/neoconf.nvim",
				cmd = "Neoconf",
				config = true,
			},
			{
				"folke/neodev.nvim",
				opts = {
					experimental = { pathStrict = true },
				},
			},
			"williamboman/mason.nvim",
			"simrat39/rust-tools.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/cmp-nvim-lsp",
			},
			{
				"b0o/schemastore.nvim",
				lazy = false,
			},
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				signs = true,
				virtual_text = false,
				-- virtual_text = { spacing = 4 },
				severity_sort = true,
			},
			autoformat = true,
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				rust_analyzer = {},
				tsserver = {
					init_options = {
						plugins = {
							{
								name = "typescript-styled-plugin",
								location = "/Users/jec/typescript-plugins/lib/",
							},
						},
					},
				},
				jsonls = {
					-- lazy-load schemastore when needed
					on_new_config = function(new_config)
						new_config.settings.json.schemas = new_config.settings.json.schemas or {}
						vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
					end,
					settings = {
						json = {
							format = {
								enable = true,
							},
							validate = { enable = true },
						},
					},
				},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
			setup = {},
		},
		config = function(_, opts)
			-- setup autoformat
			require("plugins.lsp.format").autoformat = opts.autoformat
			-- setup formatting and keymaps
			require("util").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
			end)

			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup_handlers({ setup })
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.stylua,
					nls.builtins.diagnostics.flake8,
				},
			}
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
}
