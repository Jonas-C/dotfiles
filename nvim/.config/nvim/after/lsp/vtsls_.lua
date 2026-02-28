local function ends_with(str, ending)
	return ending == "" or string.sub(str, -#ending) == ending
end

return {
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
	-- TODO: Replace these with handlers
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
						if #result ~= 1 and ends_with(value.targetUri, ignored_path) then
							table.remove(result, key)
						end
					end
				end
			end

			-- Defer to the built-in handler after filtering the results
			vim.lsp.handlers["textDocument/definition"](_, result, ...)
		end,
	},
}
