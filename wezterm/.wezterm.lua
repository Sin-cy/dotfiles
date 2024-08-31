
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 16
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { 'calt=0' }
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 10
--
-- config = {
--     font = wezterm.font("JetBrains Mono"),
--     font_size = 15,
--     automatically_reload_config = true,
--     enable_tab_bar = false,
--     window_decorations = "RESIZE",
--     adjust_window_size_when_changing_font_size = false,
--     window_padding = {
--         top = 30,
--     }
-- }

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
        key="LeftArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bb"}
    },
    {
        key="RightArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bf"}
    },
}

-- Keep adding configuration options here
-- Adding custom color scheme config
--
config.color_scheme = "rose-pine"
config.colors = {
    background = "#1a1a1c",
}

return config

