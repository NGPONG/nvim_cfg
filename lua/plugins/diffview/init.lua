require 'plugins.manager'.define(function(use)
  use "sindrets/diffview.nvim"
end)

require 'plugins.manager'.setup(function(use)
  require 'plugins.diffview.keys'
  require 'plugins.diffview.autocmd'
  require 'plugins.diffview.setup'
end)