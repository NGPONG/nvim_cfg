local M = {}

------------------------------------------------------------------------------------------------
local logger = require 'utils.log'
local tools = require 'utils.tool'
local helper = require 'plugins.neo-tree.helper'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
function M.set_donot_used_cursor_autocmds()
  local tabnr = helper.get_tabnr()
  local bufnr = helper.get_bufnr()
  local group_id = helper.new_augroup(tabnr)

  vim.api.nvim_create_autocmd('WinEnter', {
    group = group_id,
    buffer = bufnr,
    callback = function(_)
      helper.hide_cursor()
    end
  })

  vim.api.nvim_create_autocmd('WinLeave', {
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

  vim.api.nvim_exec_autocmds('WinEnter', {
    group = group_id,
    buffer = bufnr,
  })
end

function M.del_all_autocmds()
  local tabnr = helper.get_tabnr()

  helper.del_augroup(tabnr)

  helper.unhide_cursor()
end
------------------------------------------------------------------------------------------------

return M