return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {

        -- your configuration comes here
        -- or leave it empty to use default settings
        -- refer to configuration section below
    }
}  
