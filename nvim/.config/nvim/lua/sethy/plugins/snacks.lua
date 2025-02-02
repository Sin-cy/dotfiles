return {
    "folke/snacks.nvim",
    priority = 1000,
    -- lazy = false,
    config = function()
        local snacks = require("snacks")
        snacks.setup({
            explorer = {
                enabled = true,
                -- leave it empty to use the default settings
                -- NOTE: 
                -- Tab : selecting file or files & m to move into the naivgated directory
                -- r : rename
                -- c : copy
                -- d : delete
                -- a : adding
            },
            quickfile = {
                exclude = { "latex" },
            },
        })

        -- Define keybindings
        vim.keymap.set("n", "<leader>lg", function() snacks.lazygit() end, { desc = "Lazygit" })
        vim.keymap.set("n", "<leader>gl", function() snacks.lazygit.log() end, { desc = "Lazygit Logs" })
        vim.keymap.set("n", "<leader>es", function() snacks.picker.explorer() end, { desc = "Opens snacks picker explorer" })
        vim.keymap.set("n", "<leader>rN", function() snacks.rename.rename_file() end, { desc = "Fast Rename Current File" })
        vim.keymap.set("n", "<leader>dB", function() snacks.bufdelete() end, { desc = "delete current buffer & prompts confirmation" })

    end
}
