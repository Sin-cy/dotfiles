return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        local prettier_config = {
            "prettier",
            args = { "--tab-width","4", "--no-config" }
        }

        conform.setup({
            formatters_by_ft = {
                javascript = prettier_config,
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = prettier_config,
                html = prettier_config,
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                liquid = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },
            ---format_on_save = {
            --lsp_fallback = true,
            --async = false,
            --timeout_ms = 1000,
            --},
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
