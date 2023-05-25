------------------------------------------------------------------------------------------------
local tools = require 'utils.tool'
local logger = require 'utils.log'
local events = require 'native.events'
local binder = require 'utils.keybinder'
------------------------------------------------------------------------------------------------

local M = {}

------------------------------------------------------------------------------------------------
function M.mapping_opts(...)
  return {
    silent = true,
    noremap = true,
    nowait = true,
  }
end

function M.rm_global_keymaps(...)
  return {
    ['sv'] = function(...) end,
    ['sh'] = function(...) end,
    ['s0'] = function(...) end,
    ['sc'] = function(...) end,
    ['s9'] = function(...) end,
    ['ts'] = function(...) end,
    ['z'] = function(...) end,
    ['Z'] = function(...) end,
    ['x'] = function(...) end,
    ['X'] = function(...) end,
    ['c'] = function(...) end,
    ['C'] = function(...) end,
    ['r'] = function(...) end,
    ['a'] = function(...) end,
    ['A'] = function(...) end,
    ['v'] = function(...) end,
    ['b.'] = function(...) end,
    ['b,'] = function(...) end,
    ['bm'] = function(...) end,
    ['bm'] = function(...) end,
    ['bs'] = function(...) end,
    ['bp'] = function(...) end,
    ['bc'] = function(...) end,
    ['B<'] = function(...) end,
    ['B>'] = function(...) end,
    ['u'] = function(...) end,
  }
end

function M.set_global_keymaps(...)
  return {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/940
    -- https://www.reddit.com/r/vim/comments/4ofv82/the_normal_command_is_really_cool/
    ['<CR>'] = 'open_with_window_picker',

    -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/942
    ['<'] = 'prev_source',
    ['>'] = 'next_source',

    ['e'] = 'expand_all_nodes',
    ['E'] = 'close_all_nodes',
    --['<SPACE>'] = 'toggle_preview',
    ['sv'] = 'split_with_window_picker',
    ['sh'] = 'vsplit_with_window_picker',
    ['ts'] = 'open_tabnew',
    ["gA"]  = "git_add_all",
    ["gu"] = "git_unstage_file",
    ["ga"] = "git_add_file",
    ["gr"] = "git_revert_file",
    ["gc"] = "git_commit",
    ["gp"] = "git_push",
  }
end

function M.set_filesys_keymaps(...)
  return {
    ['cd'] = function(state)
      if state.tree:get_node().level == 0 then
        require("neo-tree.sources.filesystem.commands").navigate_up(state)
      else
        require("neo-tree.sources.filesystem.commands").set_root(state)
      end
      require("neo-tree.sources.manager").refresh("filesystem")
    end,
    ['<ESC>'] = function(state)
      if state.search_pattern ~= nil then
        require("neo-tree.sources.filesystem.commands").clear_filter(state)
      end
      tools.feedkeys('<ESC>')
    end,
    ['g,'] = 'prev_git_modified',
    ['g.'] = 'next_git_modified',
    ['<C-f>'] = 'filter_on_submit',
    ['a'] = 'add',
    ['h'] = 'toggle_hidden',
  }
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- 移除全局的key
events.rg_on_nvim_enter(function ()
  -- https://neovim.io/doc/user/motion.html#up-down-motions
  binder.keymap(binder.E_NORMAL, '<C-m>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<CR>', '<NOP>')
end)

-- 绑定全局的key
events.rg_on_nvim_enter(function ()
  binder.keymap(binder.E_NORMAL, '<C-m>', '<CMD>Neotree action=focus toggle=true<CR>', { remap = false, silent = true })
end)
------------------------------------------------------------------------------------------------

return M