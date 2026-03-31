return {
    -- manual formatting for markdown
   {
      'sickill/vim-pasta',
      config = function()
         vim.g.pasta_enabled_filetypes = { 'markdown' } -- Enable for Markdown
      end,
   },
}
