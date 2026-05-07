local noice = require("noice")

noice.setup({
    cmdline = {
        enabled = false,
    },
    views = {
        popupmenu = {
            relative = "editor",
            position = {
                row = 8,
                col = "50%",
            },
            win_options = {
                winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
        },
        -- nui's mini popup
        mini = {
            timeout = 3500,
            size = {
                width = "auto",
                height = "auto",
                max_height = 15,
            },
            position = {
                row = -2,
                col = "100%",
            },
        }
    },
    lsp = {
        progress = {
            enabled = true,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        signature = {
            auto_open = { enabled = false }, -- disable auto signature help on insert mode
        },
        hover = {
            enabled = true,
            silent = true, -- suppress 'No Information Available' msg
        },
    },
    routes = {
        {
            filter = {
                event = 'msg_show',
                any = {
                    { find = '%d+L, %d+B' },
                    { find = '; after #%d+' },
                    { find = '; before #%d+' },
                    { find = '%d fewer lines' },
                    { find = '%d more lines' },
                },
            },
            opts = { skip = true },
        }
    },
    messages = {
        enabled = false,
    },
    health = {
        checker = true,
    },
    popupmenu = {
        enabled = true,
        backend = "cmp",
    },
    signature = {
        enabled = true,
    },
})
