local wezterm = require("wezterm")
local mux = wezterm.mux
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
		key = "1",
		mods = "SUPER",
		action = wezterm.action.SendString("\x02\x31"),
	},
	{
		key = "2",
		mods = "SUPER",
		action = wezterm.action.SendString("\x02\x32"),
	},
	{
		key = "3",
		mods = "SUPER",
		action = wezterm.action.SendString("\x02\x33"),
	},
	{
		key = "4",
		mods = "SUPER",
		action = wezterm.action.SendString("\x02\x34"),
	},
	{
		key = "5",
		mods = "SUPER",
		action = wezterm.action.SendString("\x02\x35"),
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

wezterm.on("gui-attached", function()
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

return {
	enable_tab_bar = false,
	send_composed_key_when_left_alt_is_pressed = true,
	term = "wezterm",
	line_height = 1.3,
	cell_width = 0.9,
	underline_position = -8,
	window_decorations = "RESIZE",
	show_update_window = true,
	check_for_updates = true,

	font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "Bold" }),

	color_scheme = "Material Darker (base16)",
	-- Yellow cursor for neovim :)
	colors = {
		cursor_bg = "#FFCC00",
		cursor_fg = "white",
	},
	font_size = 10.5,
	audible_bell = "Disabled",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	keys = keys,
}
