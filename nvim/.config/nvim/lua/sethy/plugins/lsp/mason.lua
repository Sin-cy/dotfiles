return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        -- "saghen/blink.cmp",
    },
    config = function()
        -- import mason and mason_lspconfig
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- NOTE: Moved from lspconfig.lua
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")             -- import cmp-nvim-lsp plugin
        local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

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
            -- servers for mason to install
            ensure_installed = {
                "lua_ls",
                -- "ts_ls", currently using a ts plugin
                "html",
                "cssls",
                "tailwindcss",
                "gopls",
                "emmet_ls",
                "emmet_language_server",
                -- "eslint",
                "marksman",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "pylint",
                "clangd",
                "denols",
                { 'eslint_d', version = '13.1.2' },
            },
            -- NOTE: mason BREAKING Change! Removed setup_handlers -> now using handlers = {}
            handlers = {
                -- Default handler for all servers
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                -- Custom handler for lua_ls
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    },
                                },
                            },
                        },
                    })
                end,

                -- Custom handler for emmet_ls
                ["emmet_ls"] = function()
                    lspconfig.emmet_ls.setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html",
                            "typescriptreact",
                            "javascriptreact",
                            "css",
                            "sass",
                            "scss",
                            "less",
                            "svelte",
                        },
                    })
                end,

                -- Custom handler for emmet_language_server
                ["emmet_language_server"] = function()
                    lspconfig.emmet_language_server.setup({
                        filetypes = {
                            "css",
                            "eruby",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "less",
                            "sass",
                            "scss",
                            "pug",
                            "typescriptreact",
                        },
                        init_options = {
                            includeLanguages = {},
                            excludeLanguages = {},
                            extensionsPath = {},
                            preferences = {},
                            showAbbreviationSuggestions = true,
                            showExpandedAbbreviation = "always",
                            showSuggestionsAsSnippets = false,
                            syntaxProfiles = {},
                            variables = {},
                        },
                    })
                end,

                -- Custom handler for denols
                ["denols"] = function()
                    lspconfig.denols.setup({
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
                    })
                end,

                -- Custom handler for tsserver
                ["ts_ls"] = function()
                    lspconfig.ts_ls.setup({
                        capabilities = capabilities,
                        root_dir = function(fname)
                            local util = lspconfig.util
                            return not util.root_pattern("deno.json", "deno.jsonc")(fname)
                                and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
                        end,
                        single_file_support = false,
                        init_options = {
                            preferences = {
                                includeCompletionsWithSnippetText = true,
                                includeCompletionsForImportStatements = true,
                            },
                        },
                    })
                end,
            },
        })
    end,
}
