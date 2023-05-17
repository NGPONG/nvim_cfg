------------------------------------------------------------------------------------------------
local binder = require 'utils.keybinder'
local logger = require 'utils.log'
local bufdelete = require('bufdelete')
------------------------------------------------------------------------------------------------

-- 绑定全局的key
------------------------------------------------------------------------------------------------
binder.keymap(binder.E_NORMAL, 'b.', '<CMD>BufferLineCycleNext<CR>', { remap = false })
binder.keymap(binder.E_NORMAL, 'b,', '<CMD>BufferLineCyclePrev<CR>', { remap = false })
binder.keymap(binder.E_NORMAL, 'bm.', '<CMD>BufferLineMoveNext<CR>', { remap = false })
binder.keymap(binder.E_NORMAL, 'bm,', '<CMD>BufferLineMovePrev<CR>', { remap = false })
binder.keymap(binder.E_NORMAL, 'bs', '<CMD>BufferLinePick<CR>', { remap = false })
binder.keymap(binder.E_NORMAL, 'bp', '<CMD>BufferLineTogglePin<CR>', { remap = false })
binder.keymap(binder.E_NORMAL, 'bc', function()
  bufdelete.bufwipeout(0, false)
end, { remap = false })
------------------------------------------------------------------------------------------------