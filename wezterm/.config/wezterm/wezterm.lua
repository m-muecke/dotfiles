local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "nightfox",
	font = wezterm.font("Fira Code"),
	font_size = 18,
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		{ key = "m", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
		{ key = "h", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
		{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
		{ key = "W", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
		{ key = "v", mods = "CMD|CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "CMD|CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "/", mods = "CMD", action = wezterm.action.ActivateCopyMode },
		{ key = "[", mods = "CMD", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "CMD", action = act.ActivateTabRelative(1) },
		{ key = ";", mods = "CMD", action = act.ActivateTabRelative(1) },
		{ key = "H", mods = "CMD", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "J", mods = "CMD", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "K", mods = "CMD", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "L", mods = "CMD", action = act.AdjustPaneSize({ "Right", 5 }) },
	},
}
