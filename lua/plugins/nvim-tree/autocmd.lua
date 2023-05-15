------------------------------------------------------------------------------------------------
local view = require 'nvim-tree.view'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local group_id = vim.api.nvim_create_augroup("nvim-tree_group", { clear = true, })
------------------------------------------------------------------------------------------------

--require('plugins.nvim-tree.keys').on_open_tree = function()
--  if not view.is_visible() then
--
--  else
--    print('hello,visible')
--  end
--end
--
--require('plugins.nvim-tree.keys').on_close_tree = function()
--  if not view.is_visible() then
--
--  else
--    print('hello,visible')
--  end
--end

--[[   binder.keymap(binder.E_NORMAL, 'sk', function()
    logger.info(view.get_winnr())
    logger.info(vim.api.nvim_get_current_win())

    if (view.get_winnr() == vim.api.nvim_get_current_win()) then
      M.guicursor = vim.o.guicursor
      vim.o.guicursor = ''
    end

    return '<CMD>wincmd h<CR>'
  end, opts('', { expr = true, remap = false }))
  binder.keymap(binder.E_NORMAL, 's;', function()
    local tree_win = view.get_winnr()
    local current_win = vim.api.nvim_get_current_win()

    vim.o.guicursor = M.guicursor
    M.guicursor = nil

    return '<CMD>wincmd l<CR>'
  end, opts('', { expr = true, remap = false }))
 ]]
  -- print(vim.inspect(vim.api.nvim_get_hl(0, { name = 'Cursor' })))

  -- vim.cmd('set termguicolors')
  -- vim.cmd('hi Cursor blend=100')
  -- vim.cmd('set guicursor+=a:Cursor/lCursor')

  -- lua print(require('nvim-tree.view').is_visible())
  -- lua print(vim.inspect(vim.api.nvim_get_autocmds({pattern='*'})))

  -- binder.keymap(binder.E_ALL, ':', '<NOP>', opts('Disable command line.'))