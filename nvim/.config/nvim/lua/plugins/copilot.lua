return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			filetypes = {
				["grug-far"] = false,
				["grug-far-history"] = false,
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C- >",
				},
			},
		})
	end,
}
