------------------------------------------------------------------------------------------------
local events = require 'native.events'
local logger = require 'utils.log'
local tools = require 'utils.tool'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local group_id = vim.api.nvim_create_augroup("ngpong_diffview_group", { clear = true, })
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg_on_open_diffview(function ()
  if #vim.api.nvim_get_autocmds({ group = group_id }) ~= 0 then
    return
  end

  tools.hide_cursor()

  vim.api.nvim_create_autocmd('BufEnter', {
    group = group_id,
    pattern = { 'DiffviewFilePanel', 'DiffviewFileHistoryPanel' },
    callback = function()
      logger.info('buffer enter')
      tools.hide_cursor()
    end
  })

  vim.api.nvim_create_autocmd('BufLeave', {
    group = group_id,
    pattern = { 'DiffviewFilePanel', 'DiffviewFileHistoryPanel' },
    callback = function()
      logger.info('buffer leave')
      tools.unhide_cursor()
    end
  })
end)

events.rg_on_close_diffview(function()
  if #vim.api.nvim_get_autocmds({ group = group_id }) == 0 then
    return
  end

  vim.api.nvim_clear_autocmds({ group = group_id })
end)
------------------------------------------------------------------------------------------------