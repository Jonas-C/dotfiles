local M = {}
local utils = require("util")

M.server = function(server, config)
	config = config or {}
	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
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
	M.server("biome")
	M.server("html")
	M.server("taplo")
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
	M.server("volar", {
		init_options = {
			vue = {
				hybridMode = true,
			},
		},
	})
	M.server("tailwindcss")
	M.server("graphql", {
		filetypes = { "graphql", "typescript", "typescriptreact" },
	})
	M.server("jsonls", {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})

	M.server("vtsls", {
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
		},
		settings = {
			typescript = {
				preferences = {
					importModuleSpecifier = "relative",
				},
			},
			javascript = {
				preferences = {
					importModuleSpecifier = "relative",
				},
			},
			vtsls = {
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
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
						"node_modules/@ndla/styled-system/types/jsx.d.ts",
						"styled-system/lib/types/jsx.d.ts",
						"types/jsx.d.ts",
					}

					for key, value in ipairs(result) do
						for _, ignored_path in pairs(ignored_paths) do
							-- If textDocument/definition returns more than one result, remove any result contained within ignored_paths.
							if #result ~= 1 and utils.ends_with(value.targetUri, ignored_path) then
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

	M.server("gopls")
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
	M.setup_servers()
end

return M
