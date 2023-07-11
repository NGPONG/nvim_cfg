------------------------------------------------------------------------------------------------
local tool = require 'utils.tool'
local logger = require 'utils.log'
local keymap = require 'plugins.bufferline.keys'
local async = require 'plenary.async'
local events = require 'common.events'
local event_name = require 'common.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local await_schedule = async.util.scheduler
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.VIM_ENTER, async.void(function()
  keymap.set_native_keymaps()
end))
------------------------------------------------------------------------------------------------