return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C- >",
					decline = "<C-c>",
					next = "<C-n>",
					previous = "<C-p>",
				},
			},
		})
	end,
}
