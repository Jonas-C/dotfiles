return {
	"TimUntersberger/neogit",
	cond = not vim.g.vscode,
	opts = {
		integrations = {
			diffview = true,
		},
	},
}
