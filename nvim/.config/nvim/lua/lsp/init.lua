local M = {}
local utils = require("util")

local mason = require("mason-registry")

M.default_capabilities = function()
	return require("cmp_nvim_lsp").default_capabilities()
end

M.get_install_path = function(package)
	local pkg = mason.get_package(package)
	return pkg.get_install_path(pkg)
end

M.get_ts_pkg = function(package)
	local path = M.get_install_path(package)
	return { name = package, location = path }
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
	M.server("yamlls")
	M.server("eslint")
	M.server("graphql")
	M.server("cssmodules_ls")
	M.server("cssls")
	M.server("jsonls", {
		on_new_config = function(new_config)
			new_config.settings.json.schemas = new_config.settings.json.schemas or {}
			vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
		end,
		settings = {
			validate = { enable = true },
		},
	})

	require("rust-tools").setup()

	require("typescript").setup({
		server = {
			capabilities = M.default_capabilities(),
			init_options = {
				plugins = {
					{
						name = "@styled/typescript-styled-plugin",
						-- Surprisingly, using a / in a package name causes some issues with the fs.
						location = M.get_install_path("typescript-styled-plugin"),
					},
				},
				preferences = {
					importModuleSpecifierPreference = "relative",
				},
			},
			handlers = {
				-- When there are multiple results on the same line for a definition, only
				-- show the first one. This prevents many times where going to definition
				-- opens a quickfix list when it really doesn't need to.
				["textDocument/definition"] = function(_, result, ...)
					if vim.tbl_islist(result) then
						local ignored_paths = {
							"react/index.d.ts",
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
		signs = true,
		severity_sort = true,
		float = {
			border = "rounded",
		},
	})
	require("lsp.handlers").register_handlers()
	require("lsp.autocmd")
	require("lsp.null-ls")
	require("neodev").setup({})
	M.setup_servers()
end

return M
