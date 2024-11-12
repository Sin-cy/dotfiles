return {
    -- Adding a filename to the Top Right
    {
        "b0o/incline.nvim",
        dependencies = {},
        event = "BufReadPre",
        priority = 1200,
        config = function()
            local devicons = require("nvim-web-devicons")
            require("incline").setup({
                window = {
                    padding = 0,
                    margin = { horizontal = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    local filetype = vim.bo[props.buf].filetype
                    local icon, color = devicons.get_icon_color_by_filetype(filetype)

                    local modified = vim.bo[props.buf].modified
                    local buffer = {
                        icon and { " ", icon, " ", guifg = color }
                        or "",
                        " ",
                        { filename, gui = modified and "bold" },
                        " ",
                        guibg = "#000",
                    }
                    return buffer
                end,
            })
        end,
    },
}
