local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.force_reverse_video_cursor = true
config.font_size = 16
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }
config.max_fps = 120
config.enable_kitty_graphics = true
config.window_close_confirmation = "NeverPrompt"
config.macos_window_background_blur = 12
config.window_background_opacity = 0.67
config.audible_bell = "Disabled"

config.window_padding = {
	left = 1,
	right = 0,
	top = 10,
	bottom = 5,
}

-- Key bindings for zoom and delete word
config.keys = {
	-- {
	-- 	key = "+",
	-- 	mods = "CMD",
	-- 	action = wezterm.action.IncreaseFontSize,
	-- },
	-- {
	-- 	key = "-",
	-- 	mods = "CMD",
	-- 	action = wezterm.action.DecreaseFontSize,
	-- },
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
    -- background = "#0D0D0D", -- darker gray
    background = "#000", -- pure black
	-- background = "#1a1a1e", -- fav
    cursor_bg = "#9B96B5",
	cursor_fg = "#1a1a1e",
	cursor_border = "#9B96B5",
}

return config
