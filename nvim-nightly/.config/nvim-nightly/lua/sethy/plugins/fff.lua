require("fff").setup({
    install = {
        timeout = 1200,
    },
    title = "Find Files",
    max_results = 60,
    max_threads = 4,
    lazy_sync = true,

    -- UI (kept your nice emoji + layout)
    prompt = "🛸 ",
    layout = {
        width = 0.75,
        height = 0.85,
        prompt_position = "bottom",
        preview_position = "right",
        preview_size = 0.5,
        flex = false,
    },

    preview = {
        enabled = true,
        max_lines = 100,
        max_size = 10 * 1024 * 1024,
        chunk_size = 8192,
        binary_file_threshold = 1024,
        line_numbers = false,
        wrap_lines = false,
        show_file_info = true,
        history = {
            enabled = true,
            db_path = vim.fn.stdpath("data") .. "/fff_queries",
            min_combo_count = 3,
            combo_boost_score_multiplier = 100,
        },
    },

    keymaps = {
        close = { "<C-c>", "<Esc>" },
        select = "<CR>",
        select_split = "<C-s>",
        select_vsplit = "<C-v>",
        select_tab = "<C-t>",
        move_up = { "<Up>", "<C-p>", "<C-k>" },
        move_down = { "<Down>", "<C-n>", "<C-j>" },
        preview_scroll_up = "<C-u>",
        preview_scroll_down = "<C-d>",
    },

    git = { status_text_color = true },

    hl = {
        border = "FloatBorder",
        normal = "Normal",
        cursor = "CursorLine",
        matched = "IncSearch",
        title = "Title",
        prompt = "Question",
        active_file = "Visual",
        frecency = "Number",
        debug = "Comment",
        git_staged = "FFFGitStaged",
        git_modified = "FFFGitModified",
        git_deleted = "FFFGitDeleted",
        git_renamed = "FFFGitRenamed",
        git_untracked = "FFFGitUntracked",
        git_ignored = "FFFGitIgnored",
    },

    frecency = {
        enabled = true,
        db_path = vim.fn.stdpath("cache") .. "/fff_nvim",
    },

    history = {
        enabled = true,
        db_path = vim.fn.stdpath("data") .. "/fff_queries",
        min_combo_count = 3,
        combo_boost_score_multiplier = 100,
    },

    debug = {
        show_scores = false, -- keep true during beta if you want to help the dev
    },
})

-- === Keymaps — adjusted for easier navigation (standard <leader>f* style) ===
vim.keymap.set("n", "<leader>pf", function()
    require("fff").find_files()
end, { desc = "Open file picker" })

vim.keymap.set("n", "<leader>ps", function()
    require("fff").live_grep({
        grep = {
            modes = { "fuzzy", "plain" },
        },
    })
end, { desc = "Live fffuzy grep word" })

vim.keymap.set("n", "<leader>pgf", function()
    require("fff").find_in_git_root()
end, { desc = "Find files in git root" })

vim.keymap.set("n", "<leader>pcf", function()
    require("fff").find_files_in_dir("~/dotfiles/nvim-nightly/.config/nvim-nightly")
end, { desc = "Find files in specified path" })
