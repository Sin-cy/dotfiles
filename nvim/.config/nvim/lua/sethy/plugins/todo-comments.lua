return {
	-- Quickly Jump through the todo tags
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim"},
	config = function()
		local todo_comments = require("todo-comments")

		todo_comments.setup({
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info" , alt = {"Personal"} },
				HACK = { icon = " ", color = "warning", alt = { "DON SKIP" } },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO", "READ", "COLORS", "Custom" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				FORGETNOT = { icon = " ", color = "hint" },
			},
            -- Patterns for hl markdown support
            highlight = {
                multiline = true,
                multiline_pattern = "^.",
                multiline_context = 10,
                before = "",
                keyword = "wide",
                after = "fg",
                pattern = {
                    [[.*<(KEYWORDS)\s*:]], -- default pattern
                    [[<!--\s*(KEYWORDS)\s*:.*-->]], -- HTML comments with colon
                    [[<!--\s*(KEYWORDS)\s*.*-->]], -- HTML comments without colon
                },
                comments_only = false, -- highlighting outside of comments
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                pattern = [[\b(KEYWORDS)\b]],
            },
		})

		-- keymaps
		vim.keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })
	end,
}
