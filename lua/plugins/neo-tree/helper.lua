local M = {}

------------------------------------------------------------------------------------------------
local render = require('neo-tree.ui.renderer')
local manager = require('neo-tree.sources.manager')
local tools = require('utils.tool')
local logger = require('utils.log')
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local group_ids = {}
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

function M.hide_cursor()
  tools.hide_cursor()
end

function M.unhide_cursor()
  tools.unhide_cursor()
end

function M.get_bufnr()
  return tools.get_bufnr()
end

function M.get_tabnr()
  return tools.get_tabnr()
end

function M.del_augroup(key)
  local group_id = group_ids[key]

  if group_id then
    group_ids[key] = nil
  end

  vim.api.nvim_del_augroup_by_id(group_id)
end

function M.new_augroup(key)
  if group_ids[key] ~= nil then
    return group_ids[key]
  end

  local group_name = 'ngpong_neo-tree_group_' .. key

  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true, })

  group_ids[key] = group_id

  return group_id
end
------------------------------------------------------------------------------------------------

return M