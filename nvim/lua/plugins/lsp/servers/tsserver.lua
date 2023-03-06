local lspconfig = require("lspconfig")
local _ = {}
_.setup = function(on_attach, capabilities)
	require("typescript").setup({
		filetypes = { "javascript" },
		server = {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
			init_options = {
				plugins = {
					{
						name = "typescript-styled-plugin",
						location = "/Users/jec/typescript-plugins/lib/",
					},
				},
			},
		},
	})
end

return _
