------------------------------------------------------------------------------------------------
local events = require 'common.events'
local event_name = require 'common.events'.Name
local logger = require 'utils.log'
local tools = require 'utils.tool'
local keymap = require 'plugins.neoscroll.keys'
local async = require 'plenary.async'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local await_schedule = async.util.scheduler
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.VIM_ENTER, async.void(function()
  keymap.set_native_keymaps()
end))

events.rg(event_name.SETUP_NEOSCROLL, async.void(function(cfg)
  local performance_cfg = {
    -- https://github.com/karb94/neoscroll.nvim/issues/80
    pre_hook = function()
      vim.opt.eventignore:append({
          'WinScrolled',
          'CursorMoved',
      })
    end,
    post_hook = function()
      vim.opt.eventignore:remove({
          'WinScrolled',
          'CursorMoved',
      })
    end,
  }

  tools.tbl_r_extend(cfg, performance_cfg)
end))
------------------------------------------------------------------------------------------------