require 'plugins.manager'.define(function(use)
  use 'nvim-lua/plenary.nvim'
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.plenary.test_spec'
end)