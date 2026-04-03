return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            -- configure treesitter
            treesitter.setup({})

            -- ensure these languages parsers are installed
            local ensure_installed = {
                "json", "javascript", "typescript", "tsx", "go", "yaml", "html", "css", "python",
                "http", "prisma", "markdown", "markdown_inline", "svelte", "graphql", "bash", "lua", "vim", "dockerfile",
                "gitignore", "query", "vimdoc", "c", "java", "rust", "ron",
            }

            treesitter.install(ensure_installed)

            -- Safe FileType autocmd for highlighting + indentation
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    local buf = args.buf
                    local ft = vim.bo[buf].filetype
                    local lang = vim.treesitter.language.get_lang(ft)

                    if not lang then
                        return
                    end

                    -- load parser and start treesitter safely
                    pcall(vim.treesitter.language.add, lang)
                    pcall(vim.treesitter.start, buf, lang)

                    -- enable indentation (skip yaml/markdown like before)
                    if ft ~= "yaml" and ft ~= "markdown" then
                        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        vim.bo[buf].smartindent = false
                        vim.bo[buf].cindent = false
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
