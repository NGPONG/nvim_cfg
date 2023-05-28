local M = {}

------------------------------------------------------------------------------------------------
local render = require('neo-tree.ui.renderer')
local manager = require('neo-tree.sources.manager')
local tools = require('utils.tool')
local logger = require('utils.log')
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
function M.is_open(...)
  for _, source in ipairs(require('neo-tree').config.sources) do
    local state = manager.get_state(source)
    if state and state.winid and render.is_window_valid(state.winid) then
      return true
    end
  end

  return false
end

function M.get_status(...)
  local is_init = true
  local is_focus = false

  for _, source in ipairs(require('neo-tree').config.sources or {}) do
    local state = require('neo-tree.sources.manager').get_state(source)

    if state and state.bufnr then
      is_init = false
    end

    if state and state.bufnr and state.bufnr == tools.get_bufnr() then
      is_focus = true
    end
  end

  return is_init, is_focus
end
------------------------------------------------------------------------------------------------

return M