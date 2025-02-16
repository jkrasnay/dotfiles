local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16

config.color_scheme = 'GruvboxDark'

config.hide_tab_bar_if_only_one_tab = true

return config
