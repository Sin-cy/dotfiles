return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                -- enable indentation
                indent = {
                    enable = true,
                    disable = { "yaml", "markdown" },
                },
                -- auto install parsers for new filetype
                auto_install = true,

                -- ensure these languages parsers are installed
                ensure_installed = {
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "go",
                    "yaml",
                    "html",
                    "css",
                    "python",
                    "http",
                    "prisma",
                    "markdown",
                    "markdown_inline",
                    "svelte",
                    "graphql",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "query",
                    "vimdoc",
                    "c",
                    "java",
                    "rust",
                    "ron",
                },
                incremental_selection = {
                    enable = false,
                },
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                    if lang and vim.treesitter.get_parser(0, lang, { error = false }) then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        -- prevents any possible conflicting indent options
                        vim.bo.smartindent = false
                        vim.bo.cindent = false
                    end
                end,
            })

        end,
    },
    -- NOTE: js,ts,jsx,tsx Auto Close Tags
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
        config = function()
            -- Independent nvim-ts-autotag setup
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,           -- Auto-close tags
                    enable_rename = true,          -- Auto-rename pairs
                    enable_close_on_slash = false, -- Disable auto-close on trailing `</`
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true, -- Disable auto-closing for HTML
                    },
                    ["typescriptreact"] = {
                        enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
                    },
                },
            })
        end,
    },
}
