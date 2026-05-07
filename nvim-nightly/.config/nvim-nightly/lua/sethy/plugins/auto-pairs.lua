local autopairs = require("nvim-autopairs")

-- setup autopairs
autopairs.setup({
    check_ts = true, -- treesitter enabled
    ts_config = {
        lua = { "string" }, -- dont add pairs in lua string treesitter nodes
        -- javascript = { "template_string" }, -- dont add pairs in javscript template_string treesitter nodes
        java = false, -- dont check treesitter on java
    },
})

-- blink integration (if not using cmp) 
vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpAccept",
    callback = function()
        require("nvim-autopairs").autopairs_cr()
    end,
})
