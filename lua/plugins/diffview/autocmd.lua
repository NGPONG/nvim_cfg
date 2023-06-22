------------------------------------------------------------------------------------------------
local events = require 'native.events'
local event_name = require 'native.events'.Name
local logger = require 'utils.log'
local tools = require 'utils.tool'
local helper = require 'plugins.diffview.helper'
local async = require 'plenary.async'
local await_schedule = require 'plenary.async'.util.scheduler
local condvar = require 'plenary.async'.control.Condvar.new()
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.OPEN_DIFFVIEW, async.void(function (view)
  -- 因为 diffview 存在一些异步初始化工作导致的一些奇怪的问题
  vim.on_key(async.void(function(_)
    condvar:notify_all()

    vim.on_key(nil, helper.get_nsid())
  end, helper.get_nsid()))
end))

events.rg(event_name.OPEN_DIFFVIEW, async.void(function (view)
  condvar:wait()

  local tabnr = helper.get_tabnr()
  local bufnr = helper.get_diffview_bufnr()
  local group_id = helper.new_groupid(tabnr)

  vim.api.nvim_create_autocmd('BufEnter', {
    group = group_id,
    buffer = bufnr,
    callback = function(_)
      helper.hide_cursor()
    end
  })

  vim.api.nvim_create_autocmd('BufLeave', {
    group = group_id,
    buffer = bufnr,
    callback = function(_)
      helper.unhide_cursor()
    end
  })

  vim.api.nvim_create_autocmd('ModeChanged', {
    group = group_id,
    buffer = bufnr,
    callback = function(_)
      if vim.api.nvim_get_mode().mode ~= 'n' then
        helper.unhide_cursor()
      else
        helper.hide_cursor()
      end
    end
  })

  vim.api.nvim_exec_autocmds('BufEnter', {
    group = group_id,
    buffer = bufnr,
  })
end))

events.rg(event_name.CLOSE_DIFFVIEW, async.void(function(view)
  local view_tabnr = view.tabpage
  local curr_tabnr = helper.get_tabnr()
  local group_id = helper.pop_groupid(view_tabnr)

  if view_tabnr == curr_tabnr then
    helper.unhide_cursor()
  end

  vim.api.nvim_clear_autocmds({ group = group_id })
end))

events.rg(event_name.OPEN_DIFFVIEW, async.void(function (view)
  -- 注册切换 buffer 的时候切换 diff 的逻辑
  condvar:wait()
end))
------------------------------------------------------------------------------------------------