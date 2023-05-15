require 'plugins.manager'.define(function(use)
  use {
    'karb94/neoscroll.nvim'
  }
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.neoscroll.setup'
  require 'plugins.neoscroll.keys'
end)