return {
    {
        "nvzone/showkeys",
        lazy = true, -- auto run on startup
        cmd = "ShowkeysToggle",
        opts = {
            position = "top-right",
            maxkeys = 3,
            show_count = true,
            winopts = {
                focusable = false,
                relative = "editor",
                style = "minimal",
                border = "single",
                height = 1,
                row = 1,
                col = 0,
            },
        },
    },
    vim.keymap.set("n", "<leader>ks", "<cmd>ShowkeysToggle<CR>", {
        desc = "Toggle Showkeys",
    })
}
