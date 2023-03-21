return {
	"TimUntersberger/neogit",
	cond = not vim.g.vscode,
	lazy = true,
	opts = {
		integrations = {
			diffview = true,
		},
	},
}
