-- vim ui2
require('vim._core.ui2').enable({
    enable = true,
    msg = {
        target = "cmd", -- options: cmd(classic), msg(similar to noice)
        pager = { height = 0.5 },
        dialog = { height = 0.5 },
        cmd    = { height = 0.5 },
        msg   = { height = 0.5, timeout = 4500 },
    },
})

require("sethy.core")
require("sethy.pack")
require("current-theme")
