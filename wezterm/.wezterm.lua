local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 16
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 50

config.window_padding = {
	left = 5,
	right = 0,
	top = 30,
	bottom = 0,
}

-- Key bindings for zoom and delete word
config.keys = {
	{
		key = "+",
		mods = "CMD",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
}

-- Configs
-- Add Custom Color Scheme
config.color_scheme = "rose-pine"

config.colors = {
	-- background = "#12151B", -- fav
	background = "#1a1a1e", -- fav
	-- background = "#181A21",
	-- background = "#0D0D0D",
	-- background = "#202124",
}

return config
