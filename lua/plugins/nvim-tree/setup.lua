------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/nvim-tree/nvim-tree.lua
--  2. https://github.com/nvim-tree/nvim-tree.lua/wiki
--  3. https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
--  4. https://github.com/Tolomeo/nvim-tree.lua/wiki/Recipes#creating-an-actions-menu-using-telescope
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local events = require 'native.events'
local event_name = require 'native.events'.Name
local logger = require 'utils.log'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function on_attach(bufnr)
  events.emit(event_name.TREE_SETUP, bufnr)
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
  view = {
    centralize_selection = false,
    --debounce_delay = 15,
    cursorline = true,
    signcolumn = "yes",
  },
  renderer = {
    root_folder_label = true,
    group_empty = true,
    highlight_git = true,
    add_trailing = false,
    full_name = true,
    indent_width = 2,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = 'after',
      padding = ' '
    },
    highlight_modified = 'all',
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
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  on_attach = on_attach,
})
------------------------------------------------------------------------------------------------