require 'plugins.manager'.define(function(use)
  use {
    'ellisonleao/gruvbox.nvim',
  }
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.colorscheme.opts'
  require 'plugins.colorscheme.setup'
end)