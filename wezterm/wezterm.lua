local wezterm = require("wezterm")
-- local sessionizer = require("lua.sessionizer")
local config = wezterm.config_builder()

-- appearance
config.font_dirs = { '/Library/Fonts/' }
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 17
config.color_scheme = "rose-pine"
config.window_background_opacity = 0.5
config.macos_window_background_blur = 20
config.colors = { background = "#000000" }
config.window_padding = {
  left = 18,
  right = 15,
  top = 20,
  bottom = 5,
}

config.max_fps = 120
config.animation_fps = 120
config.front_end = "WebGpu"
config.prefer_egl = true

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }

return config
