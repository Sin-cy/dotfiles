-- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs

require("snacks").setup({
    styles = {
        input = {
            keys = {
                n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
            },
        }
    },

    -- Snacks Modules
    input = { enabled = true },
    quickfile = {
        enabled = true,
        exclude = { "latex" },
    },

    picker = {
        enabled = true,
        matchers = {
            frecency = true,
            cwd_bonus = false,
        },
        exclude = {
            ".git",
            "node_modules",
            "dist",
            "build",
        },
        formatters = {
            file = {
                filename_first = true,
                filename_only = false,
                icon_width = 2,
            },
        },
        layout = {
            preset = "telescope", -- defaults to this layout unless overridden
            cycle = false,
        },
        layouts = {
            select = {
                preview = false,
                layout = {
                    backdrop = false,
                    width = 0.6,
                    min_width = 80,
                    height = 0.4,
                    min_height = 10,
                    box = "vertical",
                    border = "rounded",
                    title = "{title}",
                    title_pos = "center",
                    { win = "input", height = 1, border = "bottom" },
                    { win = "list", border = "none" },
                    { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
                }
            },
            telescope = {
                reverse = true, -- set to false for search bar on top
                layout = {
                    box = "horizontal",
                    backdrop = false,
                    width = 0.8,
                    height = 0.9,
                    border = "none",
                    {
                        box = "vertical",
                        { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                        { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                    },
                    {
                        win = "preview",
                        title = "{preview:Preview}",
                        width = 0.50,
                        border = "rounded",
                        title_pos = "center",
                    },
                },
            },
            ivy = {
                layout = {
                    box = "vertical",
                    backdrop = false,
                    width = 0,
                    height = 0.4,
                    position = "bottom",
                    border = "top",
                    title = " {title} {live} {flags}",
                    title_pos = "left",
                    { win = "input", height = 1, border = "bottom" },
                    {
                        box = "horizontal",
                        { win = "list", border = "none" },
                        { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                    },
                },
            },
        }
    },

    image = {
        enabled = function()
            return vim.bo.filetype == "markdown"
        end,
        doc = {
            float = false,
            inline = false,
            max_width = 50,
            max_height = 30,
            wo = { wrap = false },
        },
        convert = {
            notify = true,
            command = "magick"
        },
        img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "Archives/All-Vault-Images/", "~/Library", "~/Downloads" },
    },

    dashboard = {
        enabled = false,
        sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            {
                text = {
                    { " " },
                    { "󰒲  Loaded with vim.pack • Neovim 0.12", hl = "SnacksDashboardFooter" },
                },
                padding = 2,
            },
        },
    },
})

--  todo-comments integration 
vim.keymap.set("n", "<leader>lg", function() require("snacks").lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gl", function() require("snacks").lazygit.log() end, { desc = "Lazygit Logs" })
vim.keymap.set("n", "<leader>rN", function() require("snacks").rename.rename_file() end, { desc = "Fast Rename Current File" })
vim.keymap.set("n", "<leader>dB", function() require("snacks").bufdelete() end, { desc = "Delete or Close Buffer (Confirm)" })

-- Snacks Picker
vim.keymap.set( {"n","x"}, "<leader>pws", function() require("snacks").picker.grep_word() end, { desc = "Search Visual selection or Word" })
vim.keymap.set("n", "<leader>pk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, { desc = "Search Keymaps (Snacks Picker)" })

-- Git Stuff
vim.keymap.set("n", "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end, { desc = "Pick and Switch Git Branches" })

-- Other Utils
vim.keymap.set("n", "<leader>th", function() require("snacks").picker.colorschemes({ layout = "ivy" }) end, { desc = "Pick Color Schemes" })
vim.keymap.set("n", "<leader>vh", function() require("snacks").picker.help() end, { desc = "Help Pages" })

-- todo-comments w/ Snacks
vim.keymap.set("n", "<leader>pt", function() require("snacks").picker.todo_comments() end, { desc = "All" })
vim.keymap.set("n", "<leader>pT", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FORGETNOT", "FIXME", "!" } }) end, { desc = "mains" })
