local M = {}

-------------------------------------------------------------------------------------
local neotree_ui_inputs = require 'neo-tree.ui.inputs'
local neotree_ui_command = require 'neo-tree.sources.common.commands'
local tools = require 'utils.tool'
local logger = require 'utils.log'
local lib = require 'diffview.lazy'.require 'diffview.lib'
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
local group_ids = {}
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
  neotree_ui_inputs.confirm(msg, handler)
end

function M.git_commit()
  neotree_ui_command.git_commit()
end

function M.git_push()
  neotree_ui_command.git_push()
end

function M.hide_cursor()
  tools.hide_cursor()
end

function M.unhide_cursor()
  tools.unhide_cursor()
end

function M.get_diffview_bufnr()
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

function M.get_tabnr()
  return tools.get_tabnr()
end

function M.pop_groupid(key)
  local group_id = group_ids[key]

  if group_id then
    group_ids[key] = nil
  end

  return group_id
end

function M.new_groupid(key)
  local group_name = 'ngpong_diffview_group_' .. key

  local group_id = vim.api.nvim_create_augroup(group_name, { clear = true, })

  group_ids[key] = group_id

  return group_id
end

function M.get_nsid(key)
  return vim.api.nvim_create_namespace('ngpong_diffview_ns_' .. key)
end

function M.select_entry()
  local view = lib.get_current_view()
  if view.panel:is_open() then
    local item = view.panel:get_item_at_cursor()
    if item then
      if type(item.collapsed) == "boolean" then
        view.panel:toggle_item_fold(item)
      else
        view:set_file(item, true)
      end
    end
  end
end

function M.test(name)
  local view = lib.get_current_view()
  for _, file in ipairs(view.panel:ordered_file_list()) do
    if file.path == name then
      view:set_file(file, true)
    end
  end
end
-------------------------------------------------------------------------------------

return M