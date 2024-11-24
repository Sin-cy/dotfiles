return {
	--I got annoyed so I just stopped using it for a bit
	"folke/which-key.nvim",
    enabled = false,
	event = "VeryLazy",
	init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 500
	end,
	opts = {
        -- empty for default settings
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
