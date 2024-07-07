return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({
			delay = 100,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
			min_count_to_highlight = 2,
		})
	end,
}
