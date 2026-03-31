-- sethy/plugins/render-markdown.lua
-- Minimal native setup — uses your old Headline*Bg groups (from lazy)


-- Define colors
local color1_bg = "#ff757f"
local color2_bg = "#4fd6be"
local color3_bg = "#7dcfff"
local color4_bg = "#ff9e64"
local color5_bg = "#7aa2f7"
local color6_bg = "#c0caf5"
local color_fg = "#1F2335"

-- Heading background
-- vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s gui=bold]], color_fg, color1_bg))
-- vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s gui=bold]], color_fg, color2_bg))
-- vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s gui=bold]], color_fg, color3_bg))
-- vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s gui=bold]], color_fg, color4_bg))
-- vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s gui=bold]], color_fg, color5_bg))
-- vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s gui=bold]], color_fg, color6_bg))

require("render-markdown").setup({
    restart_highlighter = true,
    heading = {
        sign = true,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
        width = "block",
        right_pad = 1,
        -- left_pad = 1,
        -- position = "inline",

        backgrounds = {
            "Headline1Bg",
            "Headline2Bg",
            "Headline3Bg",
            "Headline4Bg",
            "Headline5Bg",
            "Headline6Bg",
        },
    },

    code = {
        sign = false,
        width = "block",
        right_pad = 1,
    },

    bullet = { enabled = true },

    checkbox = {
        enabled = true,
        unchecked = { icon = " 󰄱 " },
        checked   = { icon = " 󰱒 " },
    },
    anti_conceal = { ignore = { head_background = true } },
})
