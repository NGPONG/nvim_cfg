------------------------------------------------------------------------------------------------
local binder = require 'utils.keybinder'
local mode = require 'utils.keybinder'.Mode
local logger = require 'utils.log'
local bufdelete = require 'bufdelete'
local events = require 'native.events'
local event_name = require 'native.events'.Name
------------------------------------------------------------------------------------------------

-- 绑定全局的key
------------------------------------------------------------------------------------------------
events.rg(event_name.VIM_ENTER, function ()
  binder.keymap(mode.NORMAL, 'b.', '<CMD>BufferLineCycleNext<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'b,', '<CMD>BufferLineCyclePrev<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'B>', '<CMD>BufferLineMoveNext<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'B<', '<CMD>BufferLineMovePrev<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'bs', '<CMD>BufferLinePick<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'bp', '<CMD>BufferLineTogglePin<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'bl', '<CMD>ls!<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'bc', function()
    bufdelete.bufdelete(0, false)
  end, { remap = false })
  binder.keymap(mode.NORMAL, 'BC', function()
    bufdelete.bufwipeout(0, false)
  end, { remap = false })
end)
------------------------------------------------------------------------------------------------