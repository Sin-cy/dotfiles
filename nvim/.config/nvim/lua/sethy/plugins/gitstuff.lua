return {
    -- for all git plugins 
	{
		"tpope/vim-fugitive",
	},
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim",
        },
        config = true,
        keys = {
            { "<leader>ng", "<cmd>Neogit<cr>", desc = "Opens Neogit" },
        },
        -- neogit keymaps
        vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", {silent = true, noremap = true}),
        -- vim.keymap.set("n", "<leader>gbr", ":Telescope git_branches<CR>", {silent = true, noremap = true})
    },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")

				map("v", "<leader>gs", function() -- stage selected hunk
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>gr", function() -- reset selected hunk
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer") -- stage whole buffer
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer") -- unstage whole buffer

				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")

				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

				map("n", "<leader>gbl", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")

				map("n", "<leader>gd", gs.diffthis, "Diff this")
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, "Diff this ~")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		},
	},
    -- Lazy git 
    {
        "kdheepak/lazygit.nvim",
        --NOTE: Trying out lazygit in Snacks nvim
        enabled = false,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- window border thing
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting up with keys={} allows plugin to load when command runs at the start
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
        },
    }
}
