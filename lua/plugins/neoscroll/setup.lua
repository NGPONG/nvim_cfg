------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/karb94/neoscroll.nvim
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require('neoscroll').setup({
  mappings = {},
  hide_cursor = false,
  stop_eof = true,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  performance_mode = false,

  -- https://github.com/karb94/neoscroll.nvim/issues/80
  pre_hook = function()
    vim.opt.eventignore:append({
        'WinScrolled',
        'CursorMoved',
     })
  end,
      post_hook = function()
      vim.opt.eventignore:remove({
          'WinScrolled',
          'CursorMoved',
      })
  end,
})
------------------------------------------------------------------------------------------------