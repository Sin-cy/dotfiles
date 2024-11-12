return {
	-- Adding a filename to the Top Right
	{
		"b0o/incline.nvim",
		dependencies = {},
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local devicons = require("nvim-web-devicons")
			require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guibg = "#1a1a1c", guifg = "#a9b1d6" },
                        InclineNormalNC = { guibg = "none", guifg = "#a9b1d6" },
                    },
                },
				window = {
					padding = 0,
					margin = { horizontal = 1 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[*]" .. filename
					end

					local icon, color = devicons.get_icon_color(filename)

					return {
                        { " " },
                        { icon, { " " } , guifg = color },
                        { filename },
                        { " " }
                    }
				end,
			})
		end,
	},
}
