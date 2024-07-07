vim.api.nvim_create_user_command("FormatToggle", function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	vim.g.disable_autoformat = not vim.g.disable_autoformat
end, {
	desc = "Toggle format on save",
})
