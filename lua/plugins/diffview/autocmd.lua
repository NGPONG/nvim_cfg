------------------------------------------------------------------------------------------------
local events = require 'native.events'
local event_name = require 'native.events'.Name
local logger = require 'utils.log'
local tools = require 'utils.tool'
local helper = require 'plugins.diffview.helper'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.OPEN_DIFFVIEW, function (view)
  vim.on_key(function(_)
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

    vim.on_key(nil, helper.get_nsid())
  end, helper.get_nsid())
end)

events.rg(event_name.CLOSE_DIFFVIEW, function(view)
  local tabnr = view.tabpage
  local group_id = helper.pop_groupid(tabnr)

  helper.unhide_cursor()

  vim.api.nvim_clear_autocmds({ group = group_id })
end)

events.rg(event_name.OPEN_DIFFVIEW, function (view)
  vim.on_key(function(_)
    logger.info(2)
  end, helper.get_nsid())
end)
------------------------------------------------------------------------------------------------