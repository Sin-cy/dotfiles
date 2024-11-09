return {
    -- here only for wrapping html tags
    -- emmet_ls is already installed in mason
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
        end,
}
