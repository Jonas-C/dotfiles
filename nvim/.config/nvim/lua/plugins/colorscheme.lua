return {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.material_style = "darker"
		local colors = require("material.colors")
		local c = colors.main
		require("material").setup({
			disable = {
				eob_lines = true,
			},
			high_visibility = {
				darker = true,
			},
			contrast = {
				cursor_line = true,
				terminal = true,
			},
			styles = {
				comments = { italic = true },
			},

			lualine_style = "stealth",
			plugins = {
				"gitsigns",
				"nvim-cmp",
				"nvim-web-devicons",
				"telescope",
				"which-key",
			},
			custom_highlights = {
				["TSRainbowYellow"] = { fg = c.yellow },
				["TSRainbowViolet"] = { fg = c.purple },
				["TSRainbowCyan"] = { fg = c.darkblue },
				["ScrollbarHandle"] = { fg = c.yellow },
				["NeoTreeDirectoryName"] = { fg = colors.editor.fg },
				["NeoTreeDirectoryIcon"] = { fg = colors.editor.fg },
				["NeoTreeGitUntracked"] = { fg = c.green },
				["NeoTreeNormal"] = { bg = "#1a1a1a" },
				["NeoTreeNormalNC"] = { bg = "#1a1a1a" },
				IlluminatedWordText = { bg = colors.editor.highlight },
				IlluminatedWordRead = { bg = colors.editor.highlight },
				IlluminatedWordWrite = { bg = colors.editor.highlight },
				["@include"] = {
					fg = c.cyan,
					italic = true,
				},
				DiffAdd = { bg = "#4D573E" },
				DiffDelete = { bg = "#6C3E41" },
				DiffChange = { bg = "#4D573E" },
				DiffText = { bg = "#4D573E" },
				["@tag.attribute"] = { fg = c.purple },
				["@constant.builtin"] = { fg = c.cyan },
				["@variable.builtin"] = { fg = c.cyan },
				["@property"] = { fg = c.white },
				["@member"] = { fg = c.blue },
				["@variable"] = { fg = c.white },
				["Identifier"] = { fg = c.white },
				["@variable.builtin.css"] = { fg = c.orange },
				["typescriptVariable"] = { fg = c.purple },
				["typescriptBlock"] = { fg = c.white },
				["typescriptIdentifierName"] = { fg = c.white },
				["typescriptArrowFunc"] = { fg = c.purple },
				["typescriptDestructureAs"] = { fg = c.cyan },
				["typescriptAssign"] = { fg = c.cyan },
				["typescriptDestructureComma"] = { fg = c.cyan },
				["typescriptParentExp"] = { fg = c.cyan },
				["typescriptDotNotation"] = { fg = c.cyan },
				["typescriptEndColons"] = { fg = c.cyan },
				["tsxAttrib"] = { fg = c.purple },
				["htmlTagName"] = { fg = c.red },
				["typescriptBinaryOp"] = { fg = c.cyan },
				["@interface"] = { fg = c.yellow },
				["@constructor.tsx"] = { fg = c.yellow },
				["@punctuation.bracket.tsx"] = { fg = c.yellow },
				["@type"] = { fg = c.yellow },
				["TSType"] = { fg = c.yellow },
				["Type"] = { fg = c.yellow },
				["@keyword"] = { fg = c.cyan },
				["@keyword.return"] = { fg = c.cyan },
				["@function.builtin"] = { fg = c.cyan },
				["@property.styled"] = { fg = c.fg },
				["@identifier.styled"] = { fg = c.white },
				["@type.styled"] = { fg = c.purple },
				["@tag"] = { fg = c.red },
				["@label.json"] = { fg = c.purple },
				Structure = { fg = c.yellow },
				NonText = { fg = c.white },
				["@type.builtin"] = { fg = c.yellow },
				["@parameter"] = { fg = c.white },
				["@field"] = { fg = c.white },
				["@punctuation.special.styled"] = { fg = c.yellow },
				["@storageclass.lifetime"] = { fg = c.purple },
				["@namespace"] = { fg = c.yellow },
				["@function.macro"] = { fg = c.yellow },
				["@punctuation.special"] = { fg = c.cyan },
				["@none"] = { fg = c.yellow },
				["@dollar"] = { fg = c.yellow },
				["@type.qualifier"] = { fg = c.orange },
				["@operator.styled"] = { fg = c.white },
				["@variable.builtin.styled"] = { fg = c.orange },
				["@property.pseudo"] = { fg = c.purple },
				["@pseudo.ampersand"] = { fg = c.yellow },
				["@conditional"] = { fg = c.cyan },
				["@keyword.declaration"] = { fg = c.purple },
				["@keyword.export.typescript"] = { fg = c.cyan },
				["@lsp.type.interface"] = { fg = c.yellow },
				GitSignsCurrentLineBlame = { link = "@comment" },
				IndentBlanklineContextChar = { fg = c.cyan },
				FloatBorder = { fg = c.white },
			},
		})
		vim.cmd([[colorscheme material]])
	end,
}
