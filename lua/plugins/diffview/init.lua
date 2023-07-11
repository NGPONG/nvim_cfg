require 'plugins.manager'.define(function(use)
  use "sindrets/diffview.nvim"
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.diffview.event'
  require 'plugins.diffview.setup'
end)