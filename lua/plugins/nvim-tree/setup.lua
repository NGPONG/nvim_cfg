------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/nvim-tree/nvim-tree.lua
--  2. https://github.com/nvim-tree/nvim-tree.lua/wiki
--  3. https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
--  4. https://github.com/Tolomeo/nvim-tree.lua/wiki/Recipes#creating-an-actions-menu-using-telescope
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local events = require 'native.events'
local logger = require 'utils.log'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function on_attach(bufnr)
  events.do_on_tree_setup(bufnr)
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  sort_by = "case_sensitive",
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
  },
  filters = {
    dotfiles = false,
  },
  view = {
    centralize_selection = false,
    --debounce_delay = 15,
    cursorline = true,
    signcolumn = "yes",
  },
  renderer = {
    root_folder_label = false,
    group_empty = true,
    highlight_git = true,
    add_trailing = false,
    full_name = true,
    --highlight_opened_files = 'all',
    highlight_modified = 'all',
    icons = {
      git_placement = 'after',
      padding = ' '
    },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 500,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  on_attach = on_attach,
})
------------------------------------------------------------------------------------------------