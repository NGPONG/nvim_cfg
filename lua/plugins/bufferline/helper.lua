local M = {}

-------------------------------------------------------------------------------------
local tools = require 'utils.tool'
local logger = require 'utils.log'
local bufdelete = require 'bufdelete'
local events = require 'common.events'
local event_name = require 'common.events'.Name
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
function M.cycle_next_buffer(_)
  if events.emit(event_name.CYCLE_NEXT_BUFFER) then
    vim.cmd('BufferLineCycleNext')
  end
end

function M.cycle_prev_buffer(_)
  if events.emit(event_name.CYCLE_PREV_BUFFER) then
    vim.cmd('BufferLineCyclePrev')
  end
end

function M.move_next_buffer(_)
  vim.cmd('BufferLineMoveNext')
end

function M.move_prev_buffer(_)
  vim.cmd('BufferLineMovePrev')
end

function M.pin_buffer(_)
  vim.cmd('BufferLineTogglePin')
end

function M.select_buffer(_)
  if events.emit(event_name.SELECT_TARGET_BUFFER) then
    vim.cmd('BufferLinePick')
  end
end

function M.buffer_list()
  vim.cmd('ls!')
end

function M.delete_buffer()
  bufdelete.bufdelete(0, false)
end

function M.wipeout_buffer()
  bufdelete.bufwipeout(0, false)
end
-------------------------------------------------------------------------------------

return M