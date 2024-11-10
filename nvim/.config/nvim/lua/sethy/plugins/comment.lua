return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        local comment = require("Comment") -- import comment just incase
        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
        -- setup Comment
        comment.setup({
            -- for commenting tsx, jsx, svelte, html files
            pre_hook = ts_context_commentstring.create_pre_hook(),
        })
    end,
}
