------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/nvim-neo-tree/neo-tree.nvim
--  2. https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
--  3. https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/doc/neo-tree.txt
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local logger = require 'utils.log'
local events = require 'common.events'
local event_name = require 'common.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function f()
  local cfg = {
    log_level = "fatal",
    log_to_file = true,
    close_if_last_window = true,
    popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
    enable_diagnostics = true,
    enable_opened_markers = true,   -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil , -- use a custom function for sorting files and directories in the tree 
    nesting_rules = {},
    use_default_mappings = false,
    hide_root_node = false,
    retain_hidden_root_indent = false,
    add_blank_line_at_top = false,
    auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
    close_floats_on_escape_key = true,
    open_files_in_last_window = true,
    resize_timer_interval = 100,
    default_component_configs = {
      container = {
        enable_character_fade = true,
        width = "100%",
        right_padding = 0,
      },
      modified = {
        symbol = "●",
      },
    },
    window = {
      position = "left",
      width = 40,
    },
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".DS_Store",
          "thumbs.db"
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
      bind_to_cwd = true,
      follow_current_file = true,
      group_empty_dirs = false,
    },
    buffers = {
      bind_to_cwd = true,
      follow_current_file = true,
      group_empty_dirs = false,
      show_unloaded = true,
    },
    source_selector = {
      sources = {
        { source = "filesystem", display_name = " 󰉓 FILES " },
        { source = "git_status", display_name = " 󰊢 GIT " },
        { source = "buffers", display_name = " 󱔗 BUFFERS " },
        { source = "document_symbols", display_name = " 󰆧 SYMBOLS " },
      },
      winbar = true,
      show_scrolled_off_parent_node = true,
      show_separator_on_edge = false,
      content_layout = "center",
      tabs_layout = 'equal',
      separator = { left = "", right= "" },
    },
    event_handlers = {
      {
        event = 'neo_tree_window_after_open',
        handler = function ()
          events.emit(event_name.OPEN_TREE)
        end
      },
      {
        event = 'neo_tree_window_after_close',
        handler = function ()
          events.emit(event_name.CLOSE_TREE)
        end
      }
    },
  }

  events.emit(event_name.SETUP_TREE, cfg)

  return cfg
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require("neo-tree").setup(f())
------------------------------------------------------------------------------------------------