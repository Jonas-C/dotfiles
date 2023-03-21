local wezterm = require("wezterm")
local keys = {
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.SendKey({
			key = "w",
			mods = "ALT",
		}),
	},
	{
		key = "s",
		mods = "SUPER",
		action = wezterm.action.SendKey({
			key = "s",
			mods = "ALT",
		}),
	},
}

return {
	enable_tab_bar = false,
	send_composed_key_when_left_alt_is_pressed = true,
	freetype_interpreter_version = 40,
	freetype_load_target = "Light",
	term = "wezterm",
	line_height = 1.2,
	-- underline_position = -20,
	underline_thickness = 2,
	underline_position = -8,
	window_decorations = "RESIZE",
	show_update_window = true,
	check_for_updates = true,
	-- font = wezterm.font("Liga SFMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	color_scheme = "Material Darker (base16)",
	-- Yellow cursor for neovim :)
	colors = {
		cursor_bg = "#FFCC00",
		cursor_fg = "white",
	},
	font_size = 11,
	audible_bell = "Disabled",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	keys = keys,
}
