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
  OPEN_TREE = 4,
  CLOSE_TREE = 5,
  OPEN_DIFFVIEW = 6,
  CLOSE_DIFFVIEW = 7,
})
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
function M.rg(name, fn)
  local handlers = event_handlers[name] or {}
  table.insert(handlers, fn)
  event_handlers[name] = handlers
end

function M.emit(name, ...)
  for i, fn in pairs(event_handlers[name] or {}) do
    local status, err = pcall(fn, ...)
    if not status then
      logger.error(err)
    end
  end
end
-------------------------------------------------------------------------------------

return M