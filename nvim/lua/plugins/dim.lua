return {
	"zbirenbaum/neodim",
	event = "LspAttach",
	opts = {
		alpha = 0.75,
		blend_color = "#000000",
		update_in_insert = {
			enable = true,
			delay = 100,
		},
		hide = {
			virtual_text = false,
			signs = false,
			underline = false,
		},
	},
}
