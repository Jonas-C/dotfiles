vim.api.nvim_set_var("mapleader", " ")
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = " ",
	eob = " ",
}
vim.opt.termguicolors = true
vim.opt.fileencoding = "utf-8"
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.wrap = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.signcolumn = "yes:2"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.timeoutlen = 300
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.helpheight = 9999
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.laststatus = 2
vim.opt.updatetime = 200
-- Do not automatically comment newlines. Caused by ftplugin
vim.api.nvim_create_autocmd("FileType", { command = "set formatoptions-=o" })