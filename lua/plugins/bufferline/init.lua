require 'plugins.manager'.define(function(use)
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.bufferline.opts'
  require 'plugins.bufferline.keys'
  require 'plugins.bufferline.setup'
end)