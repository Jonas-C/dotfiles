return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				-- Taken from https://github.com/catppuccin/nvim/discussions/323#discussioncomment-6488799
				-- Slightly modified :)
				color_overrides = {
					mocha = {
						rosewater = "#efc9c2",
						flamingo = "#ebb2b2",
						pink = "#f2a7de",
						mauve = "#b889f4",
						red = "#ea7183",
						maroon = "#ea838c",
						peach = "#f39967",
						-- This is a custom override
						yellow = "#ffcb6b",
						green = "#96d382",
						teal = "#78cec1",
						sky = "#91d7e3",
						sapphire = "#68bae0",
						blue = "#739df2",
						lavender = "#a0a8f6",
						-- This is a custom override
						text = "#ffffff",
						subtext1 = "#a6b0d8",
						subtext0 = "#959ec2",
						overlay2 = "#848cad",
						overlay1 = "#717997",
						overlay0 = "#63677f",
						surface2 = "#505469",
						surface1 = "#3e4255",
						surface0 = "#2c2f40",
						base = "#1a1c2a",
						mantle = "#141620",
						crust = "#0e0f16",
					},
				},
				no_italic = true, -- Force no italic
				custom_highlights = function(colors)
					return {
						["NeoTreeDirectoryName"] = { fg = colors.text },
						["NeoTreeDirectoryIcon"] = { fg = colors.text },
						["NeoTreeRootName"] = { fg = colors.text },
						["NeoTreeNormal"] = { bg = colors.base },
						["NeoTreeNormalNC"] = { bg = colors.base },
						["NeoTreeTabInactive"] = { bg = colors.base },
						["WinSeparator"] = { fg = colors.surface0 },
						["NeoTreeWinSeparator"] = { fg = colors.surface0 },
						["@parameter"] = { fg = colors.text },
						["@punctuation.bracket"] = { fg = colors.yellow },
						["@punctuation.special"] = { fg = colors.sapphire },
						["@variable.builtin"] = { fg = colors.flamingo },
						["@variable.builtin.css"] = { fg = colors.maroon },
						["@lsp.type.interface"] = { fg = colors.yellow },
						["@tag.builtin"] = { fg = colors.red },
						["@tag"] = { fg = colors.yellow },
						["@tag.attribute.tsx"] = { fg = colors.mauve },
						["BlinkCmpDoc"] = { bg = colors.base },
						["BlinkCmpDocBorder"] = { bg = colors.base, fg = colors.surface0 },
						["BlinkCmpDocSeparator"] = { fg = colors.surface0 },
						["BlinkCmpMenu"] = { bg = colors.base },
						["BlinkCmpMenuBorder"] = { bg = colors.base, fg = colors.surface0 },
						["BlinkCmpLabelDescription"] = { fg = colors.text },
						["BlinkCmpLabelMatch"] = { fg = colors.peach },
						["BlinkCmpLabel"] = { fg = colors.text },
						["SnacksIndent"] = { fg = colors.surface0 },
						["SnacksIndentScope"] = { fg = colors.sky },
						["FloatBorder"] = { bg = colors.base, fg = colors.surface0 },
						["NormalFloat"] = { bg = colors.base },
						["SnacksPickerList"] = { bg = colors.base },
						["SnacksPickerInput"] = { bg = colors.base },
						["SnacksPickerPreview"] = { bg = colors.base },
						["LualineTmuxWindowActive"] = { fg = colors.base, bg = colors.yellow },
						["LualineTmuxWindowInactive"] = { fg = colors.base, bg = colors.sapphire },
					}
				end,
				integrations = {
					harpoon = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					mason = true,
					neotree = true,
					neogit = true,
					noice = true,
					semantic_tokens = true,
					diffview = true,
					blink_cmp = true,
					snacks = true,
					illuminate = {
						enabled = true,
						lsp = true,
					},
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
