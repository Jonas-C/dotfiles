local M = {}

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
	M.server("tsserver", {
		init_options = {
			plugins = {
				M.get_ts_pkg("typescript-styled-plugin"),
			},
		},
	})
end

M.setup = function()
	vim.diagnostic.config({
		underline = true,
		update_in_insert = false,
		signs = true,
		severity_sort = true,
	})
	require("lsp.autocmd")
	require("lsp.null-ls")
	require("neodev").setup({})
	M.setup_servers()
end

return M
