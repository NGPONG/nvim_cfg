local M = {}

-------------------------------------------------------------------------------------
local inputs = require 'neo-tree.ui.inputs'
local command = require 'neo-tree.sources.common.commands'
local tools = require 'utils.tool'
local logger = require 'utils.log'
local lib = require 'diffview.lazy'.require 'diffview.lib'
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
M.group_ids = {}
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
function M.infer_cur_file()
  local view = lib.get_current_view()

  if view == nil then
    return nil
  end

  return view:infer_cur_file(false)
end

function M.confirm(msg, handler)
  inputs.confirm(msg, handler)
end

function M.git_commit()
  command.git_commit()
end

function M.git_push()
  command.git_push()
end

function M.hide_cursor()
  tools.hide_cursor()
end

function M.unhide_cursor()
  tools.unhide_cursor()
end

function M.get_bufnr()
  local targets = {
    "/DiffviewFilePanel$",
    "/DiffviewFileHistoryPanel$",
  }

  for _, win_id in ipairs(tools.get_win_list(tools.get_tabnr()) or {}) do
    local bufnr = vim.api.nvim_win_get_buf(win_id)
    for _, pattern in ipairs(targets) do
      if tools.get_buf_name(bufnr):match(pattern) then
        return bufnr
      end
    end
  end

  return -1
end

function M.clear_autocmd(tabnr)
  local group_id = M.group_ids[tabnr]

  if not group_id then
    return
  end

  vim.api.nvim_clear_autocmds({ group = group_id })

  M.group_ids[tabnr] = nil
end

function M.get_group_id()
  local tabnr = tools.get_tabnr()
  local group_name = 'ngpong_diffview_group_' .. tabnr

  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true, })

  M.group_ids[tabnr] = group_id

  return group_id
end
-------------------------------------------------------------------------------------

return M