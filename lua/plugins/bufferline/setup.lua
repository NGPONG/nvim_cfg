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
    separator_style = "slope",
    numbers = function(opts)
      return string.format('%s·%s', opts.ordinal, opts.lower(opts.id))
    end,
    show_tab_indicators = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "FILE EXPLOREER",
        highlight = "Directory",
        text_align = "center",
        padding = 0,
        separator = '|',
      }
    },
  },
  highlights = {
    offset_separator = {
      bg = require("gruvbox.palette").get_base_colors(vim.o.background, 'soft').bg0,
    },
  },
})
------------------------------------------------------------------------------------------------