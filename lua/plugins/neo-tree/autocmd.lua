------------------------------------------------------------------------------------------------
local events = require 'native.events'
local logger = require 'utils.log'
local tools = require 'utils.tool'
local helper = require 'plugins.neo-tree.helper'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local group_id = vim.api.nvim_create_augroup("ngpong_neo-tree_group", { clear = true, })
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg_on_open_tree(function ()
  if #vim.api.nvim_get_autocmds({ group = group_id }) ~= 0 then
    return
  end

  tools.hide_cursor()

  vim.api.nvim_create_autocmd('BufEnter', {
    group = group_id,
    pattern = { '*' },
    callback = function()
      local _, is_focus = helper.get_status()

      if is_focus then
        tools.hide_cursor()
      else
        tools.unhide_cursor()
      end
    end
  })

  vim.api.nvim_create_autocmd('ModeChanged', {
    group = group_id,
    pattern = { '*' },
    callback = function()
      if not tools.is_cursor_hide() then
        return
      end

      if vim.api.nvim_get_mode().mode ~= 'n' then
        tools.unhide_cursor()
      else
        tools.hide_cursor()
      end
    end
  })
end)

events.rg_on_close_tree(function()
  if #vim.api.nvim_get_autocmds({ group = group_id }) == 0 then
    return
  end

  vim.api.nvim_clear_autocmds({ group = group_id })
end)
------------------------------------------------------------------------------------------------