return {
    "dmtrKovalenko/fff.nvim",
    enabled = true,
    build = function()
        -- this will download prebuild binary or try to use existing rustup toolchain to build from source
        -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
        require("fff.download").download_or_build_binary()
    end,
    lazy = false,
    opts = { -- (optional)
        debug = {
            enabled = true,     -- we expect your collaboration at least during the beta
            show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
        },
    },
    config = function()
        require("fff").setup({
            install = {
                timeout = 1200, -- 20 minutes - should be plenty
            },
            title = 'Find Files',  -- Window title
            max_results = 60,     -- Maximum search results to display
            max_threads = 4,      -- Maximum threads for fuzzy search
            lazy_sync = true,
            -- UI dimensions and appearance
            prompt = '🛸 ',       -- Input prompt symbol
            layout = {
                width = 0.85,          -- Window width as fraction of screen
                height = 0.85,         -- Window height as fraction of screen
                prompt_position = 'bottom', -- or 'top'
                preview_position = 'right', -- or 'left', 'right', 'top', 'bottom'
                preview_size = 0.5,
            },
            preview = {
                enabled = true,
                max_lines = 100,
                max_size = 10 * 1024 * 1024, -- 1MB
                chunk_size = 8192,
                binary_file_threshold = 1024,
                line_numbers = false,
                wrap_lines = false,
                show_file_info = true,
                history = {
                    enabled = true,
                    db_path = vim.fn.stdpath('data') .. '/fff_queries',
                    min_combo_count = 3, -- file will get a boost if it was selected 3 in a row times per specific query
                    combo_boost_score_multiplier = 100, -- Score multiplier for combo matches
                },
            },
            keymaps = {
                close = {'<C-c>','<Esc>'},
                select = '<CR>',
                select_split = '<C-s>',
                select_vsplit = '<C-v>',
                select_tab = '<C-t>',
                -- Multiple bindings supported
                move_up = { '<Up>', '<C-p>', '<C-k>' },
                move_down = { '<Down>', '<C-n>', '<C-j>'},
                preview_scroll_up = '<C-u>',
                preview_scroll_down = '<C-d>',
            },
            git = {
                status_text_color = true, -- Enable git status colors on filename text
            },
            -- Highlight groups
            hl = {
                border = 'FloatBorder',
                normal = 'Normal',
                cursor = 'CursorLine',
                matched = 'IncSearch',
                title = 'Title',
                prompt = 'Question',
                active_file = 'Visual',
                frecency = 'Number',
                debug = 'Comment',
                git_staged = 'FFFGitStaged',       -- Files staged for commit
                git_modified = 'FFFGitModified',   -- Modified unstaged files
                git_deleted = 'FFFGitDeleted',     -- Deleted files
                git_renamed = 'FFFGitRenamed',     -- Renamed files
                git_untracked = 'FFFGitUntracked', -- New untracked files
                git_ignored = 'FFFGitIgnored',     -- Git-ignored files
            },
            frecency = {
                enabled = true,
                db_path = vim.fn.stdpath('cache') .. '/fff_nvim',
            },
            history = {
                enabled = true,
                db_path = vim.fn.stdpath('data') .. '/fff_queries',
                min_combo_count = 3, -- file will get a boost if it was selected 3 in a row times per specific query
                combo_boost_score_multiplier = 100, -- Score multiplier for combo matches
            },
            -- Debug options
            debug = {
                show_scores = false,  -- Toggle with F2 or :FFFDebug
            },
        })
    end,
    keys = {
        {
            "<leader>pf",
            function()
                require("fff").find_files()
            end,
            desc = "Open file picker",
        },
        {
            "<leader>pgf",
            function()
                require("fff").find_in_git_root()
            end,
            desc = "Find files in git root",
        },
        {
            "<leader>pcf",
            function()
                 require("fff").find_files_in_dir("~/dotfiles/nvim/.config/nvim") -- Find files in a specific directory
            end,
            desc = "Find files in specified path",
        },
    },
}


