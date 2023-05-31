------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/sindrets/diffview.nvim
--  2. https://github.com/sindrets/diffview.nvim/blob/main/doc/diffview.txt
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local logger = require 'utils.log'
local tool = require 'utils.tool'
local event = require 'native.events'
local binder = require 'plugins.diffview.keys'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function hook_cfg()
  return {
    hooks = {
      view_opened = function ()
        event.do_on_open_diffview()
      end,
      view_closed = function ()
        event.do_on_close_diffview()
      end
    },
  }
end

local function keymap_rebind_cfg()
  return {
    keymaps = {
      disable_defaults = true,
      file_panel = binder.set_filepanel_keymaps()
    }
  }
end

local function cfg()
  local cfg = {
    diff_binaries = false,
    enhanced_diff_hl = false,
    git_cmd = { "git" },
    hg_cmd = { "hg" },
    use_icons = true,
    show_help_hints = true,
    watch_index = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
      done = "✓",
    },
    view = {
      default = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true,
        winbar_info = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
    },
    file_panel = {
      listing_style = "list",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        type = 'split',
        position = "left",
        width = 40,
        win_opts = {}
      },
    },
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
        hg = {
          single_file = {},
          multi_file = {},
        },
      },
      win_config = {
        type = 'split',
        position = "bottom",
        height = 16,
        win_opts = {}
      },
    },
    commit_log_panel = {
      win_config = {
        win_opts = {},
      }
    },
    default_args = {
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
  }

  cfg = tool.tbl_r_deepextend(keymap_rebind_cfg(), cfg)
  cfg = tool.tbl_r_deepextend(hook_cfg(), cfg)

  return cfg
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require("diffview").setup(cfg())