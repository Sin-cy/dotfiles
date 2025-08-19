return {
	"nvim-lua/plenary.nvim", --lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window nav
    -- fixes the well know nvim bug
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                {
                    path = "${3rd}/plenary.nvim/lua",
                    words = { "plenary" }
                },
            },
        },
    }

}
