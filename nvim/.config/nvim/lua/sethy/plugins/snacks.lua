return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            explorer = {
                enabled = true,
            },
            quickfile = {
                exclude = { "latex" },
            },
            picker = {
                layout = {
                    -- presets options : "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
                    -- override the preset in keymaps function as a param below
                    preset = "telescope",
                },
                matcher = {
                    frecency = true,
                },
                width = 80,
                height = 50,
            },
        },
        keys = {
            { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
            { "<leader>es", function() require("snacks").explorer() end, desc = "Open Snacks Explorer" },
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
            { "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete Buffer (Confirm)" },

            -- Snacks Picker
            { "<leader>pf", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)" },
            { "<leader>pc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep word" },
            { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search Visual selection or Word", mode = { "n", "x" } },
            { "<leader>pk", function() require("snacks").picker.keymaps({ layout = "select" }) end, desc = "Search Keymaps (Snacks Picker)" },

            -- Git Stuff
            { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick and Switch Git Branches" },

            -- Other Utils
            { "<leader>th" , function() require("snacks").picker.colorschemes({ layout = "ivy" }) end, desc = "Pick Color Schemes"},
            { "<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages" },
        }
    },
    -- todo comments
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        optional = true,
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "Todo" },
            { "<leader>pT", function () require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
        },
    }
}
