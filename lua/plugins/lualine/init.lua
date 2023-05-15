require 'plugins.manager'.define(function(use)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.lualine.setup'
end)