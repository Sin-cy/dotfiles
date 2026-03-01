return {
    {
        "NvChad/nvim-colorizer.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        config = function()
            local colorizer = require("colorizer")

            colorizer.setup({
                user_commands = true, options = {
                    parsers = {
                        hex = {
                            enable = true,
                            rrggbb = true,
                            rgb = true,
                            rgba = true,
                            rrggbbaa = true,
                        },
                        css = true,
                        -- tailwind completions setup in nvim cmp
                        tailwind = {
                            enable = true,
                            lsp = true,
                            update_names = true,
                        },
                    }
                },
                filetypes = {
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "javascriptreact",
                    "typescriptreact",
                    "vue",
                    "svelte",
                    "astro",

                    toml = {
                        parsers = {
                            hex = {
                                enable = true,
                            },
                            names = false,
                        },
                    },
                },
            })
        end,
    },
}

