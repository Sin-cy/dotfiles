local treesitter = require("nvim-treesitter")

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

-- force treesitter indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        -- only set if the language has a parser
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and vim.treesitter.get_parser(0, lang, { error = false }) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            -- disable old indents that may conflict
            vim.bo.smartindent = false
            vim.bo.cindent = false
        end
    end,
})

-- NOTE: js,ts,jsx,tsx Auto Close Tags
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
