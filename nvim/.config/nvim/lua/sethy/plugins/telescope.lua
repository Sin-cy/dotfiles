return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.providers.telescope")

		local builtin = require("telescope.builtin")
		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move test to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						-- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps

		vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
		vim.keymap.set(
			"n",
			"<leader>pc",
			"<cmd>Telescope grep_string<CR>",
			{ desc = "Find string under cursor in cwd" }
		)
		vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<CR>", { desc = "Find string under cursor in cwd" })
		-- Primeagens search word (love these btw)
		-- Find everywhere in my project where I used the word where the cursor is at
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		-- Find everywhere in my project where example vim.keymap.set was used
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		--Primeagen Help : find help for a command or for something
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
