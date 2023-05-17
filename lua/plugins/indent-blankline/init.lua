require 'plugins.manager'.define(function(use)
  use "lukas-reineke/indent-blankline.nvim"
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.indent-blankline.opts'
  require 'plugins.indent-blankline.setup'
end)