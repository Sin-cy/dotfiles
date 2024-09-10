return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icons" },
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
			},
		})

		-- opens parent dir over current active window
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

		-- open parent dir in float window
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
	end,
}
