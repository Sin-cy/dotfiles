require("blink.cmp").setup({
    fuzzy = {
        implementation = "lua",
    },
    -- keymaps 
    keymap = {
        preset = "default",
    },

    -- editor insert mode completions
    completion = {
        menu = {
            auto_show = true, -- show on type
        },
        documentation = {
            auto_show = true, -- show function signature/docs 
        },
        ghost_text = {
            enabled = false,
            show_with_menu = false,
        },
    },

    -- cmdline completions
    cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
        completion = {
            menu = { auto_show = true },
        },
    },

    sources = {
        default = { "lsp", "path", "buffer", "snippets" },
        providers = {
            lsp = {
                opts = {
                    tailwind_color_icon = "󱓻"
                }
            }
        }
    },

    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },

    snippets = {
        preset = "luasnip"
    },
})

require("luasnip.loaders.from_vscode").lazy_load() -- load friendly snippets collection

