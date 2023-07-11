------------------------------------------------------------------------------------------------
local events = require 'common.events'
local event_name = require 'common.events'.Name
local logger = require 'utils.log'
local tools = require 'utils.tool'
local helper = require 'plugins.diffview.helper'
local autocmd = require 'plugins.diffview.autocmd'
local keymap = require 'plugins.diffview.keys'
local async = require 'plenary.async'
local condvar = require 'plenary.async'.control.Condvar.new()
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local await_schedule = async.util.scheduler

local await_init_diffview = async.wrap(function(callback)
  vim.on_key(async.void(function(_)
    vim.on_key(nil, helper.get_nsid())
    callback()
  end), helper.get_nsid())
end, 1)
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.INIT_DIFFVIEW, async.void(function (view)
  await_init_diffview()
  condvar:notify_all()
end))

events.rg(event_name.OPEN_DIFFVIEW_FILE_PANEL, async.void(function (view)
  condvar:wait()
  autocmd.set_donot_used_cursor_autocmds()
end))

events.rg(event_name.CLOSE_DIFFVIEW_FILE_PANEL, async.void(function(view)
  autocmd.del_all_autocmds(view)
end))

events.rg(event_name.OPEN_DIFFVIEW_FILE_HISTORY, async.void(function (view)
  condvar:wait()
  autocmd.set_donot_used_cursor_autocmds(view)
end))

events.rg(event_name.CLOSE_DIFFVIEW_FILE_HISTORY, async.void(function (view)
  autocmd.del_all_autocmds(view)
end))

events.rg(event_name.CYCLE_NEXT_BUFFER, async.void(function(_)
end))

events.rg(event_name.CYCLE_PREV_BUFFER, async.void(function(_)
end))

events.rg(event_name.SELECT_TARGET_BUFFER, async.void(function(_)
end))

events.rg(event_name.SETUP_DIFFVIEW, async.void(function(cfg)
  local hook_cfg = {
    hooks = {
      view_opened = helper.view_opened,
      view_closed = helper.view_closed,
    }
  }

  local keymap_rebind_cfg = {
    keymaps = {
      disable_defaults = true,
      file_panel = keymap.set_filepanel_keymaps(),
      view = keymap.set_view_keymaps(),
      file_history_panel = keymap.set_filehistorypanel_keymaps(),
    }
  }

  tools.tbl_r_extend(cfg, keymap_rebind_cfg, hook_cfg)
end))
------------------------------------------------------------------------------------------------