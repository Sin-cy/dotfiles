return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = true,
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		config = function()
			-- Define color variables
			local color1_bg = "#ff757f"
			local color2_bg = "#4fd6be"
			local color3_bg = "#7dcfff"
			local color4_bg = "#ff9e64"
			local color5_bg = "#7aa2f7"
			local color6_bg = "#c0caf5"
			local color_fg = "#1F2335"
			-- local color_sign = "#ebfafa"

			-- Heading colors (when not hovered over), extends through the entire line
			vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
			vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
			vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
			vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
			vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
			vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg))

			-- Highlight for the heading and sign icons (symbol on the left)
			-- I have the sign disabled for now, so this makes no effect
			vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
			vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
			vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
			vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
			vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
			vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))
		end,
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			bullet = {
				-- Turn on / off list bullet rendering
				enabled = true,
			},
			checkbox = {
				-- Turn on / off checkbox state rendering
				enabled = true,
				-- Determines how icons fill the available space:
				--  inline:  underlying text is concealed resulting in a left aligned icon
				--  overlay: result is left padded with spaces to hide any additional text
				position = "inline",
				unchecked = {
					-- Replaces '[ ]' of 'task_list_marker_unchecked'
					icon = "   󰄱 ",
					-- Highlight for the unchecked icon
					highlight = "RenderMarkdownUnchecked",
					-- Highlight for item associated with unchecked checkbox
					scope_highlight = nil,
				},
				checked = {
					-- Replaces '[x]' of 'task_list_marker_checked'
					icon = "   󰱒 ",
					-- Highlight for the checked icon
					highlight = "RenderMarkdownChecked",
					-- Highlight for item associated with checked checkbox
					scope_highlight = nil,
				},
			},
			heading = {
				sign = false,
				icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
				backgrounds = {
					"Headline1Bg",
					"Headline2Bg",
					"Headline3Bg",
					"Headline4Bg",
					"Headline5Bg",
					"Headline6Bg",
				},
				foregrounds = {
					"Headline1Fg",
					"Headline2Fg",
					"Headline3Fg",
					"Headline4Fg",
					"Headline5Fg",
					"Headline6Fg",
				},
			},
		},
		ft = { "markdown", "norg", "rmd", "org" },
	},
}
