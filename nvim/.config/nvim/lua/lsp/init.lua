local M = {}

local mason = require("mason-registry")
local utils = require("util")

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

M.setup_servers = function()
	M.server("lua_ls")
	M.server("rust_analyzer")
	M.server("yamlls")
	M.server("eslint")
	M.server("jsonls", {
		on_new_config = function(new_config)
			new_config.settings.json.schemas = new_config.settings.json.schemas or {}
			vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
		end,
		settings = {
			validate = { enable = true },
		},
	})

	require("typescript").setup({
		server = {
			capabilities = M.default_capabilities(),
			init_options = {
				plugins = {
					M.get_ts_pkg("typescript-styled-plugin"),
				},
				preferences = {
					importModuleSpecifierPreference = "relative",
				},
			},
			handlers = {
				["textDocument/definition"] = function(_, result, ...)
					-- Filter out certain paths from the results that are 99% of the time
					-- false positive results for my use case. If I explicitly jump to
					-- them, go there, otherwise ignore them.
					if vim.tbl_islist(result) then
						local ignored_paths = {
							"react/index.d.ts",
							"tailwind-variants/dist/index.d.ts",
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

	-- M.server("tsserver", {
	-- 	init_options = {
	-- 		plugins = {
	-- 			M.get_ts_pkg("typescript-styled-plugin"),
	-- 		},
	-- 	},
	-- })
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
	require("lsp.autocmd")
	require("lsp.null-ls")
	require("neodev").setup({})
	M.setup_servers()
end

return M
