------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/ellisonleao/gruvbox.nvim
--  2. https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require('gruvbox').setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = 'soft',
  palette_overrides = {},
  dim_inactive = false,
  overrides = {
    SignColumn = { bg = require("gruvbox.palette").get_base_colors(vim.o.background, 'soft').bg0 }
  },
  transparent_mode = false,
})
vim.cmd.colorscheme('gruvbox')
------------------------------------------------------------------------------------------------