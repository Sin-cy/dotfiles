
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 15
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 10

-- Key bindings for command-delete and option-delete
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
}

-- Keep adding configuration options here
-- Adding custom color scheme config
--
-- NOTE: cool night colorscheme by josean but my background
config.colors = {
    background = "#1a1a1c",
    foreground = "#CBE0F0",
    cursor_bg = "#47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    -- selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

return config

