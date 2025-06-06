vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opt = vim.opt
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = " ",
	eob = " ",
	vert = "▏",
	horiz = "▁",
}
opt.completeopt = "menu,menuone,noselect"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.wildmode = "longest:full,full"

opt.relativenumber = true
opt.termguicolors = true
opt.fileencoding = "utf-8"
opt.autoread = true
opt.autowrite = true
opt.backup = false
opt.swapfile = false
opt.hlsearch = true
opt.incsearch = true
opt.showmode = false
opt.showtabline = 2
opt.shiftround = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.numberwidth = 3
opt.signcolumn = "yes"
opt.hidden = true
opt.ignorecase = true
opt.timeoutlen = 300
opt.jumpoptions = "view"
opt.smartcase = true
opt.smartindent = true
opt.number = true
opt.helpheight = 9999
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.mouse = "a"
opt.cmdheight = 1
opt.pumheight = 10
opt.laststatus = 2
opt.linebreak = true
opt.ruler = false
opt.virtualedit = "block"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
-- TODO: Spell checking does not work in neogit commit messages. Tracked in #1305
opt.spelllang = { "en" }
opt.spelloptions = "camel,noplainbuffer"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
