------------------------------------------------------------------------------------------------
local events = require 'native.events'
local event_name = require 'native.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.VIM_ENTER, function ()
  local function set_keymap()
    local t = {}

    t['<C-p>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
    t['<C-;>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
    t['<C-S-p>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
    t['<C-:>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}

    return t
  end

  require('neoscroll.config').set_mappings(set_keymap())
end)
------------------------------------------------------------------------------------------------