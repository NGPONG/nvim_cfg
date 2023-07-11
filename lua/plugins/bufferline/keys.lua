local M = {}

------------------------------------------------------------------------------------------------
local binder = require 'common.keybinder'
local mode = require 'common.keybinder'.Mode
local helper = require 'plugins.bufferline.helper'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
function M.set_native_keymaps()
  binder.keymap(mode.NORMAL, 'b.', helper.cycle_next_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'b,', helper.cycle_prev_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'B>', helper.move_next_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'B<', helper.move_prev_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'bs', helper.select_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'bp', helper.pin_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'bl', helper.buffer_list, { remap = false })
  binder.keymap(mode.NORMAL, 'bc', helper.delete_buffer, { remap = false })
  binder.keymap(mode.NORMAL, 'BC', helper.wipeout_buffer, { remap = false })
end
------------------------------------------------------------------------------------------------

return M