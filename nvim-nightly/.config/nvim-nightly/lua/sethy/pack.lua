-- lua/sethy/pack.lua
-- native 0.12 vimpack plugin manager

vim.pack.add({
    -- Core
    { src = "https://github.com/nvim-lua/plenary.nvim" }, --enabled
    { src = "https://github.com/christoomey/vim-tmux-navigator" }, --enabled
    { src = "https://github.com/folke/lazydev.nvim" }, --enabled

    -- Plugins
    { src = "https://github.com/dmtrKovalenko/fff.nvim" }, --enabled

    -- all telescope
    { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "master" },--enabled
    { src = "https://github.com/andrew-george/telescope-themes" }, --enabled

    { src = "https://github.com/windwp/nvim-autopairs" }, --enabled
    { src = "https://github.com/nvim-lualine/lualine.nvim" }, --enabled

    { src = "https://github.com/stevearc/oil.nvim" }, --enabled

    -- { src = "https://github.com/rmagatti/auto-session" }, -- configured but disabled
    { src = "https://github.com/olrtg/nvim-emmet" }, --enabled

    -- folding
    { src = "https://github.com/kevinhwang91/nvim-ufo" }, --enabled
    { src = "https://github.com/kevinhwang91/promise-async" }, --nvim-ufo dependency

    -- { src = "https://github.com/kylechui/nvim-surround", branch = "main" }, --disabled

    -- { src = "https://github.com/ThePrimeagen/harpoon", branch = "harpoon2" }, -- disabled: currently broken with builtin vimpack
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --enabled

    { src = "https://github.com/folke/todo-comments.nvim" }, --enabled
    { src = "https://github.com/folke/trouble.nvim" }, --enabled

    { src = "https://github.com/mbbill/undotree" },--enabled

    { src = "https://github.com/folke/noice.nvim", },--enabled
    { src = "https://github.com/MunifTanjim/nui.nvim" },

    { src = "https://github.com/folke/snacks.nvim" }, --enabled
    { src = "https://github.com/echasnovski/mini.nvim" }, --enabled

    { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" }, -- enabled
    { src = "https://github.com/numToStr/Comment.nvim" }, --enabled

    -- git
    { src = "https://github.com/ThePrimeagen/git-worktree.nvim" }, --enabled
    { src = "https://github.com/lewis6991/gitsigns.nvim" }, --enabled
    { src = "https://github.com/tpope/vim-fugitive" }, --enabled
    { src = "https://github.com/kdheepak/lazygit.nvim" }, --enabled

    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }, --enabled
    { src = "https://github.com/windwp/nvim-ts-autotag" }, --enabled

    -- completions cmp
    { src = "https://github.com/hrsh7th/nvim-cmp" }, --enabled
    -- completions dependency
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/f3fora/cmp-spell" },
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.1" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/onsails/lspkind.nvim" },

    -- LSP stack
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

    { src = "https://github.com/NvChad/nvim-colorizer.lua" }, --enabled

    -- icons
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }, --enabled

    -- colorschemes
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://github.com/craftzdog/solarized-osaka.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/loctvl842/monokai-pro.nvim" },
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin-nvim" },
})

-- Custom packer commands
-- NOTE: pack add
vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (PackAdd user/repo)", })

-- NOTE: pack update
vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, { desc = "Update all plugins" })

-- NOTE: pack del
vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (space separated)" })

-- NOTE: pack nonactive - show all non active plugins on disk but removed from pack.lua
vim.api.nvim_create_user_command("PackNonActive", function()
    local non_active = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    if #non_active == 0 then
        vim.notify("🆗 No non-active plugins found!", vim.log.levels.INFO)
        return
    end

    vim.print("😴 Non-active plugins :")
    print(" ")
    -- vim.print(non_active)
    for _, name in ipairs(non_active) do
        print(name)
    end

    print(" ")
    print("→ Use :PackDel plugin1 plugin2 or :lua vim.pack.del({'plugin1','plugin2'}) to delete them")
end, {})


-- NOTE: Others

-- build step for fff.nvim
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        if event.data.updated or vim.fn.isdirectory(vim.fn.stdpath("data") .. "/site/pack/core/opt/fff.nvim/target") == 0 then
            require("fff.download").download_or_build_binary()
        end
    end,
})

-- auto run :TSUpdate on first install or when parsers change
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function()
        vim.cmd("TSUpdate")
    end,
})



-- NOTE: Call plugins

-- Core & Foundations
require("sethy.plugins.lazydev")

-- Syntax & Highlighting
require("sethy.plugins.treesitter")

-- Theme & Colors
require("sethy.plugins.colorscheme")

-- UI & Others
require("sethy.plugins.mini")
require("sethy.plugins.snacks")
require("sethy.plugins.lualine")
require("sethy.plugins.noice")

-- File Management
require("sethy.plugins.oil")
require("sethy.plugins.fff")

-- Editing Helpers
-- require("sethy.plugins.harpoon")
require("sethy.plugins.nvim-ufo")
require("sethy.plugins.auto-pairs")
require("sethy.plugins.comment")
require("sethy.plugins.colorizer")
require("sethy.plugins.render-markdown")
require("sethy.plugins.emmet")

-- Git
require("sethy.plugins.gitstuff")

-- Completion
require("sethy.plugins.nvim-cmp")

-- LSP Stack
require("sethy.plugins.lsp.mason") -- mason has to load before lspconfig
require("sethy.plugins.lsp.lspconfig")

-- Pickers & Navigation
require("sethy.plugins.telescope")

-- Diagnostics & Notes
require("sethy.plugins.trouble")
require("sethy.plugins.todo-comments")
