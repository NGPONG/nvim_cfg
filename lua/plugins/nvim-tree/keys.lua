------------------------------------------------------------------------------------------------
local binder = require 'utils.keybinder'
local tools = require 'utils.tool'
local api = require 'nvim-tree.api'
local view = require 'nvim-tree.view'
local lib = require 'nvim-tree.lib'
local logger = require 'utils.log'
local events = require 'native.events'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- BEGIN_DEFAULT_ON_ATTACH
-- vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
-- vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
-- vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))

-- vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))

-- vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
-- vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
-- vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
-- vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
-- vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
-- vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
-- vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
-- vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
-- vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
-- vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
-- vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
-- vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
-- vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
-- vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
-- vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
-- vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))

-- vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
-- vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
-- vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
-- vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
-- vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
-- vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
-- vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
-- END_DEFAULT_ON_ATTACH
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local function key_opts(bufnr, desc, other)
  local def = { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  local fin = tools.tbl_r_extend(def, other or {})
  return fin
end
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- 移除临时的key
events.rg_on_tree_setup(function (bufnr)
  binder.keymap(binder.E_NORMAL, 'sv', '<NOP>', key_opts(bufnr, 'Disable <sv>'))
  binder.keymap(binder.E_NORMAL, 'sh', '<NOP>', key_opts(bufnr, 'Disable <sh>'))
  binder.keymap(binder.E_NORMAL, 's=', '<NOP>', key_opts(bufnr, 'Disable <s=>'))
  binder.keymap(binder.E_NORMAL, 's-', '<NOP>', key_opts(bufnr, 'Disable <s->'))
  binder.keymap(binder.E_NORMAL, 's0', '<NOP>', key_opts(bufnr, 'Disable <s0>'))
  binder.keymap(binder.E_NORMAL, 'sc', '<NOP>', key_opts(bufnr, 'Disable <sc>'))
  binder.keymap(binder.E_NORMAL, 's9', '<NOP>', key_opts(bufnr, 'Disable <s9>'))
  binder.keymap(binder.E_NORMAL, 'ts', '<NOP>', key_opts(bufnr, 'Disable <ts>'))
  binder.keymap(binder.E_ALL, 'z', '<NOP>', key_opts(bufnr, 'Disable <z>'))
  binder.keymap(binder.E_NORMAL, 'Z', '<NOP>', key_opts(bufnr, 'Disable <Z>'))
  binder.keymap(binder.E_ALL, 'x', '<NOP>', key_opts(bufnr, 'Disable <x>'))
  binder.keymap(binder.E_NORMAL, 'X', '<NOP>', key_opts(bufnr, 'Disable <X>'))
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'c', '<NOP>', key_opts(bufnr, 'Disable <c>'))
  binder.keymap(binder.E_NORMAL, 'C', '<NOP>', key_opts(bufnr, 'Disable <C>'))
  binder.keymap(binder.E_NORMAL, 'r', '<NOP>', key_opts(bufnr, 'Disable <r>'))
  binder.keymap(binder.E_NORMAL, 'a', '<NOP>', key_opts(bufnr, 'Disable <a>'))
  binder.keymap(binder.E_VISUAL, 'a', '<NOP>', key_opts(bufnr, 'Disable <a>'))
  binder.keymap(binder.E_NORMAL, 'A', '<NOP>', key_opts(bufnr, 'Disable <A>'))
  binder.keymap(binder.E_NORMAL, '<ESC>', '<NOP>', key_opts(bufnr, 'Disable <ESC>'))
  binder.keymap(binder.E_NORMAL, 'v', '<NOP>', key_opts(bufnr, 'Disable <visual mode>'))
end)

-- 绑定临时的key
events.rg_on_tree_setup(function (bufnr)
  binder.keymap(binder.E_NORMAL, '<C-f>', api.live_filter.start, key_opts(bufnr, 'Filter'))
  binder.keymap(binder.E_NORMAL, 'sv', api.node.open.vertical, key_opts(bufnr, 'Vertical Split'))
  binder.keymap(binder.E_NORMAL, 'sh', api.node.open.horizontal, key_opts(bufnr, 'Horizontal Split'))
  binder.keymap(binder.E_NORMAL, 's=', '<CMD>NvimTreeResize +5<CR>', key_opts(bufnr, 'Resize nvim-tree +5 width'))
  binder.keymap(binder.E_NORMAL, 's-', '<CMD>NvimTreeResize -5<CR>', key_opts(bufnr, 'Resize nvim-tree -5 width'))
  binder.keymap(binder.E_NORMAL, '<CR>', function()
    if nil ~= lib.get_node_at_cursor() then
        api.node.open.edit()
    end
  end, key_opts(bufnr, 'Open node'))
  binder.keymap(binder.E_NORMAL, '<ESC>', function()
    if nil ~= require('nvim-tree.live-filter').filter then
      api.live_filter.clear()
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'n', false)
  end, key_opts(bufnr, 'Clean Filter or input <ESC>'))
  binder.keymap(binder.E_NORMAL, 'sc', function()
    if view.is_visible() then
      events.do_on_close_tree()
    end
    return '<CMD>wincmd c<CR>'
  end, key_opts(bufnr, 'close window', { expr = true, remap = false }))
end)

-- 移除全局的key
events.rg_on_nvim_enter(function ()
  -- https://neovim.io/doc/user/motion.html#up-down-motions
  binder.keymap(binder.E_NORMAL, '<C-m>', '<NOP>')
end)

-- 绑定全局的key
events.rg_on_nvim_enter(function ()
  binder.keymap(binder.E_NORMAL, '<C-m>', function()
    api.tree.toggle { find_file = false, current_window = false, focus = true, path = '', update_root = false }
    if view.is_visible() then
      events.do_on_open_tree()
    else
      events.do_on_close_tree()
    end
  end, { remap = false })
end)
------------------------------------------------------------------------------------------------