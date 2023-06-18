require 'plugins.manager'.define(function(use)
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        's1n7ax/nvim-window-picker',
        tag = "v1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
  }
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.neo-tree.opts'
  require 'plugins.neo-tree.keys'
  require 'plugins.neo-tree.autocmd'
  require 'plugins.neo-tree.setup'
end)