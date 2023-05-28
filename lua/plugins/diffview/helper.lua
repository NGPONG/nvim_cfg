local M = {}

-------------------------------------------------------------------------------------
local lazy = require("diffview.lazy")
local inputs = require("neo-tree.ui.inputs")
local command = require("neo-tree.sources.common.commands")

local lib = lazy.require("diffview.lib")
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
-------------------------------------------------------------------------------------

return M