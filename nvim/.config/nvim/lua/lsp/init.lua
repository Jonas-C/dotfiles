local M = {}
local utils = require("util")

M.default_capabilities = function()
	return require("cmp_nvim_lsp").default_capabilities()
end

M.server = function(server, config)
	config = config or {}

	if config.capabilities == nil then
		config.capabilities = M.default_capabilities()
	end

	require("lspconfig")[server].setup(config)
end

--- Normalize a location to a uri and range
--- @param location table
M.normalize_location = function(location)
	return {
		uri = location.uri or location.targetUri,
		range = location.range or location.targetSelectionRange,
	}
end

M.setup_servers = function()
	M.server("lua_ls")
	M.server("yamlls", {
		settings = {
			yaml = {
				keyOrdering = false,
			},
		},
	})
	M.server("pyright")
	-- TODO: Investigate why this fails M.server("ruff-lsp")
	M.server("eslint")
	M.server("cssls")
	M.server("tailwindcss")
	M.server("graphql", {
		filetypes = { "graphql", "typescript", "typescriptreact" },
	})
	M.server("jsonls", {
		on_new_config = function(new_config)
			new_config.settings.json.schemas = new_config.settings.json.schemas or {}
			vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
		end,
		settings = {
			validate = { enable = true },
		},
	})

	require("typescript-tools").setup({
		capabilities = M.default_capabilities(),
		settings = {
			separate_diagnostic_server = true,
			publish_diagnostic_on = "insert",
			-- I prefer minimal code actions
			expose_as_code_action = {},
			tsserver_plugins = {
				"@styled/typescript-styled-plugin",
			},
			tsserver_file_preferences = {
				importModuleSpecifierPreference = "relative",
			},
		},

		handlers = {
			-- When there are multiple results on the same line for a definition, only
			-- show the first one. This prevents many times where going to definition
			-- opens a quickfix list when it really doesn't need to.
			["textDocument/definition"] = function(_, result, ...)
				if vim.islist(result) then
					local ignored_paths = {
						"react/index.d.ts",
						"components/createStyleContext.tsx",
						"styled-system/types/jsx.d.ts",
					}

					for key, value in ipairs(result) do
						for _, ignored_path in pairs(ignored_paths) do
							-- If an ignored path is the first result, keep it as it's
							-- likely the intended path.
							if key ~= 1 and utils.ends_with(value.targetUri, ignored_path) then
								table.remove(result, key)
							end
						end
					end
				end

				-- Defer to the built-in handler after filtering the results
				vim.lsp.handlers["textDocument/definition"](_, result, ...)
			end,
		},
	})
end

M.setup = function()
	for name, icon in pairs(require("core.icons").diagnostics) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
	vim.diagnostic.config({
		underline = true,
		update_in_insert = false,
		signs = false,
		severity_sort = true,
		float = {
			border = "rounded",
		},
	})
	require("lsp.handlers").register_handlers()
	require("lsp.autocmd")
	require("neodev").setup({})
	M.setup_servers()
end

return M
