return {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    {
        "NvChad/nvim-colorizer.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        config = function()
            local nvchadcolorizer = require("colorizer")
            local tailwindcolorizer = require("tailwindcss-colorizer-cmp")

            nvchadcolorizer.setup({
                -- user_default_options = {
                --     tailwind = true,
                -- },
                options = {
                  parsers = {
                    tailwind = {
                      enable = true,
                      lsp = true,
                      update_names = true,
                    }
                  }
                },
                filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "astro" },
            })

            tailwindcolorizer.setup({
                color_square_width = 2,
            })

        end,
    },
}
