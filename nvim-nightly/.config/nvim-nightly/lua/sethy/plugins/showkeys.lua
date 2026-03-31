return {
    {
        "nvzone/showkeys",
        lazy = true, -- auto run on startup
        cmd = "ShowkeysToggle",
        opts = {
            position = "bottom-center",
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
        config = function(_, opts)
            require("showkeys").setup(opts)
            vim.defer_fn(function()
                vim.cmd("ShowkeysToggle")
            end, 100)
        end,
    },
}
