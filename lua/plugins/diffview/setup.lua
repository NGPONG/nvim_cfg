------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/sindrets/diffview.nvim
--  2. https://github.com/sindrets/diffview.nvim/blob/main/doc/diffview.txt
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local logger = require 'utils.log'
local events = require 'common.events'
local event_name = require 'common.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function f()
  local cfg = {
    diff_binaries = false,
    enhanced_diff_hl = true,
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

  events.emit(event_name.SETUP_DIFFVIEW, cfg)

  return cfg
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require("diffview").setup(f())
------------------------------------------------------------------------------------------------