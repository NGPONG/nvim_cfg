------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/nvim-neo-tree/neo-tree.nvim
--  2. https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
--  3. https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/doc/neo-tree.txt
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local events = require 'native.events'
local logger = require 'utils.log'
local tool = require 'utils.tool'
local keymap = require 'plugins.neo-tree.keys'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function keymap_remove_cfg()
  return {
    window = {
      mapping_options = keymap.mapping_opts(),
      mappings = keymap.rm_global_keymaps(),
    },
  }
end

local function keymap_rebind_cfg()
  return {
    window = {
      mapping_options = keymap.mapping_opts(),
      mappings = keymap.set_global_keymaps(),
    },
    filesystem = {
      window = {
        mapping_options = keymap.mapping_opts(),
        mappings = keymap.set_filesys_keymaps(),
      }
    }
  }
end

local function fix942_cfg()
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/942
  return {
    git_status_async = false,
    filesystem = {
      async_directory_scan = "never",
    },
  }
end

local function fix337_cfg()
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/337
  return {
    enable_git_status = true,
    filesystem = {
      use_libuv_file_watcher = true,
    },
  }
end

local function fixicon_cfg()
  return {
    default_component_configs = {
      indent = {
        indent_marker = "│",
        last_indent_marker = "└",
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
      },
      modified = {
        symbol = "[+]",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- this can only be used in the git_status source
          renamed   = "󰁕",-- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
    },
    document_symbols = {
      kinds = {
        File = { icon = "󰈙", hl = "Tag" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Property = { icon = "󰆧", hl = "@property" },
        Enum = { icon = "󰒻", hl = "@number" },
        Function = { icon = "󰊕", hl = "Function" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Struct = { icon = "󰌗", hl = "Type" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
        StaticMethod = { icon = '󰠄 ', hl = 'Function' },
      }
    },
  }
end

local function cfg()
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
        event = "neo_tree_buffer_enter",
        handler = function()
          tool.hide_cursor()
        end
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          tool.unhide_cursor()
        end
      }
    },
  }

  cfg = tool.tbl_r_deepextend(keymap_rebind_cfg(), cfg)
  cfg = tool.tbl_r_deepextend(keymap_remove_cfg(), cfg)
  cfg = tool.tbl_r_deepextend(fix337_cfg(), cfg)
  --cfg = tool.tbl_r_deepextend(fix942_cfg(), cfg)
  cfg = tool.tbl_r_deepextend(fixicon_cfg(), cfg)

  return cfg
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require("neo-tree").setup(cfg())
------------------------------------------------------------------------------------------------