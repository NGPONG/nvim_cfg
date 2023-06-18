------------------------------------------------------------------------------------------------
local view = require 'nvim-tree.view'
local events = require 'native.events'
local event_name = require 'native.events'.Name
local logger = require 'utils.log'
local tool = require 'utils.tool'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local group_id = vim.api.nvim_create_augroup("ngpong_nvim-tree_group", { clear = true, })
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.OPEN_TREE, function ()
  if #vim.api.nvim_get_autocmds({ group = group_id }) ~= 0 then
    return
  end

  tool.hide_cursor()

  vim.api.nvim_create_autocmd('BufEnter', {
    group = group_id,
    pattern = { '*' },
    callback = function()
      if view.get_bufnr() == vim.api.nvim_win_get_buf(0) then
        tool.hide_cursor()
      else
        tool.unhide_cursor()
      end
    end
  })
end)

events.rg(event_name.CLOSE_TREE, function()
  if #vim.api.nvim_get_autocmds({ group = group_id }) == 0 then
    return
  end

  vim.api.nvim_clear_autocmds({ group = group_id })
end)
------------------------------------------------------------------------------------------------
