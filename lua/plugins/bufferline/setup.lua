------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/akinsho/bufferline.nvim
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = 'none',
    show_buffer_close_icons = false,
    show_close_icon = true,
    separator_style = "padded_slope",
    offsets = {
      {
        filetype = "NvimTree",
        text = "FILE EXPLOREER",
        highlight = "Directory",
        text_align = "center",
        padding = 0,
      }
    },
    --highlights = {
    --},
  }
})
------------------------------------------------------------------------------------------------