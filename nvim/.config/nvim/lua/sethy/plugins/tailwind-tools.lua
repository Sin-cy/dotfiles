return {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
    } ,
    require("tailwind-tools").setup({
        document_color = {
            enabled = true,
            kind = "background",
            debounce = 100,
        },
    })
}
