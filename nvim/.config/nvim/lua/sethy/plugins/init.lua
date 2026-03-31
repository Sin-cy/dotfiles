return {
    "nvim-lua/plenary.nvim", -- functions multiple plugins need
    "christoomey/vim-tmux-navigator", -- tmux & split window nav
    -- fixes the well know nvim bug
    {
        "folke/lazydev.nvim",
        lazy = false,
        opts = {
            library = {
                {
                    path = "${3rd}/plenary.nvim/lua",
                    words = { "plenary" }
                },
                { path = "LazyVim" },
            },
        },
    },
}
