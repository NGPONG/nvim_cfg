require 'plugins.manager'.define(function(use)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.nvim-tree.keys'
  require 'plugins.nvim-tree.autocmd'
  require 'plugins.nvim-tree.setup'
end)