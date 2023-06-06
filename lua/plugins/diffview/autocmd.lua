------------------------------------------------------------------------------------------------
local events = require 'native.events'
local logger = require 'utils.log'
local tools = require 'utils.tool'
local helper = require 'plugins.diffview.helper'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg_on_open_diffview(function ()
  local ns_id = vim.api.nvim_create_namespace("ngpong_diffview_ns")

  -- 避开 diffview 的一些异步工作导致cursor无法正确设置
  vim.on_key(function(_)
    local bufnr = helper.get_bufnr()
    local group_id = helper.get_group_id()

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

    vim.on_key(nil, ns_id)
  end, ns_id)
end)

events.rg_on_close_diffview(function(view)
  helper.unhide_cursor()
  helper.clear_autocmd(view.tabpage)
end)
------------------------------------------------------------------------------------------------