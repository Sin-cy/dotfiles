-- sethy/plugins/comment.lua

-- NOTE: Default Keymaps for Comment.nvim
--   gc  → Toggle comment (linewise)          [Normal + Visual]
--   gb  → Toggle comment (blockwise)         [Normal + Visual]
--   gcc → Toggle comment on current line     [Normal only]
--   gbc → Toggle comment on current line (blockwise) [Normal only]

-- Context commentstring (must be set up first)
require("ts_context_commentstring").setup({
  enable_autocmd = false, -- Comment.nvim will handle triggering
})

-- Main Comment.nvim setup
require("Comment").setup({
  padding = true,
  sticky = true,
  ignore = "^$",

  -- integration needed for JSX/TSX/Vue/etc. files
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
