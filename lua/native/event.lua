------------------------------------------------------------------------------------------------
local tool = require 'utils.tool'
local logger = require 'utils.log'
local keymap = require 'native.keys'
local async = require 'plenary.async'
local events = require 'common.events'
local event_name = require 'common.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local await_schedule = async.util.scheduler
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.VIM_ENTER, async.void(function()
  keymap.del_native_keymaps()
  keymap.set_native_keymaps()
end))

events.rg(event_name.BUFFER_READ, async.void(function ()
  keymap.del_buffer_keymaps()
  keymap.set_buffer_keymaps()
end))
------------------------------------------------------------------------------------------------