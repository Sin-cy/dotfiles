local set = vim.opt_local

set.textwidth = 80   -- Wrap text at 80 characters
set.spell = true     -- Enable spell checking
set.linebreak = true

-- added extra highlights for markdown files to render highlights properly
-- thx to Linkarzu

local color1_bg = "#ff757f"
local color2_bg = "#4fd6be"
local color3_bg = "#7dcfff"
local color4_bg = "#ff9e64"
local color5_bg = "#7aa2f7"
local color6_bg = "#c0caf5"
local color_fg = "#1F2335"

vim.cmd(
  string.format([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color1_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.2.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color2_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.3.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color3_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.4.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color4_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.5.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color5_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.6.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color6_bg)
)

