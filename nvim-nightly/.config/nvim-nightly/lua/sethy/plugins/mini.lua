-- NOTE: mini.files (file explorer that works great alongside oil)
local mini_files = require("mini.files")
mini_files.setup({
    mappings = {
        go_in = "<CR>", -- Map both Enter and L to enter directories or open files
        go_in_plus = "L",
        go_out = "_",
        go_out_plus = "H",
    },
})
vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>ef", function()
    mini_files.open(vim.api.nvim_buf_get_name(0), false)
    mini_files.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

-- NOTE: mini.surround
require("mini.surround").setup({
    custom_surroundings = nil,
    highlight_duration = 300,
    -- INFO:
    -- saiw surround with no whitespace
    -- saw surround with whitespace
    mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'ds', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'ca', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
    },
})

-- NOTE: mini.trailspace (get rid of whitespace)
require("mini.trailspace").setup({
    only_in_normal_buffers = true,
})
vim.keymap.set("n", "<leader>cw", function() require("mini.trailspace").trim() end, { desc = "Erase Whitespace" })
-- Ensure highlight never reappears by removing it on CursorMoved
vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = "*",
    callback = function()
        require("mini.trailspace").unhighlight()
    end,
})

-- NOTE: mini.splitjoin (split & join) 
require("mini.splitjoin").setup({
    mappings = { toggle = "" }, -- Disable default mapping
})
vim.keymap.set({ "n", "x" }, "sj", function() require("mini.splitjoin").join() end, { desc = "Join arguments" })
vim.keymap.set({ "n", "x" }, "sk", function() require("mini.splitjoin").split() end, { desc = "Split arguments" })

-- NOTE: mini.comment (currently DISABLED)
-- require("mini.comment").setup({
--     options = {
--         custom_commentstring = function()
--             return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
--         end,
--     },
-- })
