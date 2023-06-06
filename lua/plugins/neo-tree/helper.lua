local M = {}

------------------------------------------------------------------------------------------------
local render = require('neo-tree.ui.renderer')
local manager = require('neo-tree.sources.manager')
local tools = require('utils.tool')
local logger = require('utils.log')
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
M.group_ids = {}
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

function M.clear_autocmds()
  local tabnr = tools.get_tabnr()
  local group_id = M.group_ids[tabnr]

  vim.api.nvim_clear_autocmds({ group = group_id })

  M.group_ids[tabnr] = nil
end

function M.get_group_id()
  local tabnr = tools.get_tabnr()
  local group_name = 'ngpong_neo-tree_group_' .. tabnr

  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true, })

  M.group_ids[tabnr] = group_id

  return group_id
end
------------------------------------------------------------------------------------------------

return M