return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false, -- Let Comment.nvim handle triggering
		},
	},
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		keys = {
			{ "gc", mode = { "n", "v" } },
			{ "gb", mode = { "n", "v" } },
			{ "gcc", mode = "n" },
			{ "gbc", mode = "n" },
		},
		opts = function()
			return {
				padding = true,
				sticky = true,
				ignore = "^$",
				pre_hook = function(ctx) -- added fall back to vim.bo.commentstring is pre hook returns nil
					local ts_pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
					local commentstring = ts_pre_hook(ctx)

					if not commentstring then
						return vim.bo.commentstring or "# %s"
					end

					return commentstring
				end,
			}
		end,
	},
}
