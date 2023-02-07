local wezterm = require("wezterm")
return {
	color_scheme = "nightfox",
	font = wezterm.font("Fira Code"),
	font_size = 18,
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		{ key = "m", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
		{ key = "h", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
		{ key = "v", mods = "CMD|CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "CMD|CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "/", mods = "CMD", action = wezterm.action.ActivateCopyMode },
	},
}
