-- NOTE: pack hooks early autocmds

-- build step for fff.nvim
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        if event.data.updated or vim.fn.isdirectory(vim.fn.stdpath("data") .. "/site/pack/core/opt/fff.nvim/target") == 0 then
            require("fff.download").download_or_build_binary()
        end
    end,
})

-- auto run :TSUpdate on first install or when parsers change
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function()
        vim.cmd("TSUpdate")
    end,
})

