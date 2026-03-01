return {
    {
        "NvChad/nvim-colorizer.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        config = function()
            local colorizer = require("colorizer")

            colorizer.setup({
                -- user_default_options = {
                --     tailwind = true,
                -- },
                options = {
                    parsers = {
                        -- tailwind completions setup in nvim cmp
                        tailwind = {
                            enable = true,
                            lsp = true,
                            update_names = true,
                        }
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
                    "toml"
                },
            })
        end,
    },
}

