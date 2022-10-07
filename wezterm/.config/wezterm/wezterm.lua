local wezterm = require 'wezterm'

return {
  color_scheme = "nightfox",
  font_size = 17.0,
  keys = {
    { key = "v", mods = 'CMD|CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    { key = "h", mods = 'CMD|CTRL', action = wezterm.action.ActivatePaneDirection "Left" },
    { key = "l", mods = 'CMD|CTRL', action = wezterm.action.ActivatePaneDirection "Right" },
    { key = "k", mods = 'CMD|CTRL', action = wezterm.action.ActivatePaneDirection "Up" },
    { key = "j", mods = 'CMD|CTRL', action = wezterm.action.ActivatePaneDirection "Down" },
  },
}
