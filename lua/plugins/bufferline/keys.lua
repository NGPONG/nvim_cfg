------------------------------------------------------------------------------------------------
local binder = require 'utils.keybinder'
local logger = require 'utils.log'
local bufdelete = require 'bufdelete'
local events = require 'native.events'
------------------------------------------------------------------------------------------------

-- 绑定全局的key
------------------------------------------------------------------------------------------------
events.rg_on_nvim_enter(function ()
  binder.keymap(binder.E_NORMAL, 'b.', '<CMD>BufferLineCycleNext<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'b,', '<CMD>BufferLineCyclePrev<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'B>', '<CMD>BufferLineMoveNext<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'B<', '<CMD>BufferLineMovePrev<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'bs', '<CMD>BufferLinePick<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'bp', '<CMD>BufferLineTogglePin<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'bl', '<CMD>ls!<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'bc', function()
    bufdelete.bufdelete(0, false)
  end, { remap = false })
  binder.keymap(binder.E_NORMAL, 'bC', function()
    bufdelete.bufwipeout(0, false)
  end, { remap = false })
end)
------------------------------------------------------------------------------------------------