local M = {}

-------------------------------------------------------------------------------------
local logger = require 'utils.log'
local tools = require 'utils.tool'
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
local event_handlers = {}
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
M.Name = tools.enum({
  BUFFER_READ = 1,
  VIM_ENTER = 2,
  TREE_SETUP = 3,
  SETUP_TREE = 4,
  OPEN_TREE = 5,
  CLOSE_TREE = 6,
  SETUP_DIFFVIEW = 7,
  INIT_DIFFVIEW = 8,
  OPEN_DIFFVIEW_FILE_PANEL = 9,
  CLOSE_DIFFVIEW_FILE_PANEL = 10,
  OPEN_DIFFVIEW_FILE_HISTORY = 11,
  CLOSE_DIFFVIEW_FILE_HISTORY = 12,
  CYCLE_NEXT_BUFFER = 13,
  CYCLE_PREV_BUFFER = 14,
  SELECT_TARGET_BUFFER = 15,
  SETUP_NEOSCROLL = 16,
})
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
function M.rg(name, fn)
  local handlers = event_handlers[name] or {}
  table.insert(handlers, fn)
  event_handlers[name] = handlers
end

function M.unrg(name, fn)
  local handlers = event_handlers[name]
  for i = 1, (handlers and #handlers or 0) do
    if handlers[i] == fn then
      table.remove(handlers, i)
      return
    end
  end
end

function M.emit(name, ...)
  local success = true
  for i, fn in pairs(event_handlers[name] or {}) do
    local status, res = pcall(fn, ...)
    if not status then
      success = false
      logger.error(res)
    end
  end
  return success
end
-------------------------------------------------------------------------------------

return M