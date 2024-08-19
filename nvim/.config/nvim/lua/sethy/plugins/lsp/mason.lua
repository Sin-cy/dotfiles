return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")
        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "gopls",
                "emmet_ls",
                "emmet_language_server"
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "pylint",
                "clangd",
                -- "eslint_d",
            },
        })
    end,
}
