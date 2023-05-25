------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/akinsho/require('bufferline').nvim
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
    enforce_regular_tabs = false, -- 标签长度是否保持一致
    offsets = {
      {
        filetype = "neo-tree",
        text = "EXPLORER",
        --highlight = "Directory",
        text_align = "center",
        padding = 0,
        separator = '|',
      }
    },
    --style_preset = {
    --  require('bufferline').style_preset.no_italic,
    --  require('bufferline').style_preset.no_bold
    --},
  },
  highlights = {
    offset_separator = {
      bg = require("gruvbox.palette").get_base_colors(vim.o.background, 'soft').bg0,
    },
  },
})
------------------------------------------------------------------------------------------------