-- vim.notify(
-- 	"=== ✅ LSP CONFIG LOADED SUCCESSFULLY ===",
-- 	vim.log.levels.INFO
-- ) vim.notify( "This is a very long error message\nLine 2\nLine 3\nLine 4\nLine 5\nLine 6\nLine 7\nLine 8\nLine 9\nLine 10\n...and it keeps going for a while to force the spill indicator",
--     vim.log.levels.ERROR
-- )

-- NOTE: LSP Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings
        local opts = { buffer = ev.buf, silent = true }
        -- Keymaps
        opts.desc = "Show LSP references" vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":lsp restart<CR>", opts)

        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
    end,
})

-- NOTE: Diagnostic Setup
-- Define sign icons for each severity
local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",
}

-- update diagnostic config function
vim.diagnostic.config({
    signs = { text = signs },
    virtual_text = true,
    underline = true,  -- Always on
    update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
    },
})

-- <leader>lx toggle for virtual text (no hover changes)
vim.keymap.set("n", "<leader>lx", function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current })
end, { desc = "Toggle LSP virtual text" })

-- NOTE: Setup servers
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Native LSP capabilities (if dropping cmp_nvim_lsp)
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if ok then
--     capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- end

-- Global LSP settings (applied to all servers)
vim.lsp.config('*', {
    capabilities = capabilities
})

-- Configure and enable LSP servers
-- lua_ls
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace",
            },
            -- workspace = {
            --     library = {
            --         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            --         [vim.fn.stdpath("config") .. "/lua"] = true,
            --     },
            -- },
        },
    },
})

-- emmet_language_server
vim.lsp.config("emmet_language_server", {
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
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

-- emmet_ls
vim.lsp.config("emmet_ls", {
    filetypes = {
        "astro",
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

-- ts_ls (TypeScript/JavaScript)
vim.lsp.config("ts_ls", {
    workspace_required = false,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    single_file_support = true,
    init_options = {
        preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayVariableTypeHints = false,
                includeInlayFunctionParameterTypeHints = false,
            },
        },
    },
})

-- gopls
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

-- css
vim.lsp.config("cssls", {
    filetypes = { "css", "scss", "less" },
    init_options = { provideFormatter = true },
    single_file_support = true,
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            },
            validate = true
        },
        scss = {
            lint = {
                unknownAtRules = "ignore"
            },
            validate = true
        },
        less = {
            lint = {
                unknownAtRules = "ignore"
            },
            validate = true
        },
    },
})

-- tailwind
vim.lsp.config("tailwindcss", {
    filetypes = {
        "html",
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "astro",
    },
    init_options = {
        userLanguages = {
            astro = "html",
        },
    },
})

vim.lsp.config("astro", {
    filetypes = { "astro" },
    init_options = {
        typescript = {
            tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
        }
    },
})

-- Instead of using mason enable all configured LSP via `automatic_enable=true`
-- Prefer more control, enable manual server call below via vim.lsp.enable("")
-- mason config: lua/sethy/plugins/lsp/mason.lua:22
vim.lsp.enable({
    "lua_ls",
    "cssls",
    "emmet_language_server",
    "emmet_ls",
    "ts_ls",
    "gopls",
    "astro",
    "tailwindcss",
    "marksman",
})
