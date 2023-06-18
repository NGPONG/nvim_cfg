------------------------------------------------------------------------------------------------
local tool = require 'utils.tool'
local binder = require 'utils.keybinder'
local mode = require 'utils.keybinder'.Mode
local logger = require 'utils.log'
local events = require 'native.events'
local event_name = require 'native.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- 移除全局 keymap
events.rg(event_name.VIM_ENTER, function ()
  -- https://neovim.io/doc/user/repeat.html#complex-repeat
  binder.keymap(mode.NORMAL, 'q', '<NOP>')
  binder.keymap(mode.NORMAL, 'Q', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#left-right-motions
  binder.keymap(mode.NORMAL, '$', '<NOP>')
  binder.keymap(mode.NORMAL, '0', '<NOP>')
  binder.keymap(mode.NORMAL, '^', '<NOP>')
  binder.keymap(mode.NORMAL, 'h', '<NOP>')
  binder.keymap(mode.NORMAL, 'l', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-H>', '<NOP>')
  binder.keymap(mode.NORMAL, '<SPACE>', '<NOP>')
  binder.keymap(mode.NORMAL, 't', '<NOP>')
  binder.keymap(mode.NORMAL, 'T', '<NOP>')
  binder.keymap(mode.NORMAL, ';', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<A-LEFT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<A-RIGHT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<RIGHT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<LEFT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<C-S-RIGHT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<C-S-LEFT>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#up-down-motions
  binder.keymap(mode.NORMAL, 'j', '<NOP>')
  binder.keymap(mode.NORMAL, 'k', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-P>', '<NOP>')
  binder.keymap(mode.NORMAL, '+', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, '<C-m>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<C-J>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<C-UP>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<A-UP>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<C-DOWN>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<A-DOWN>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<UP>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<DOWN>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<C-S-UP>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT, mode.VISUAL }, '<C-S-DOWN>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#word-motions
  binder.keymap(mode.NORMAL, 'w', '<NOP>')
  binder.keymap(mode.NORMAL, 'W', '<NOP>')
  binder.keymap(mode.NORMAL, 'E', '<NOP>')
  binder.keymap(mode.NORMAL, 'b', '<NOP>')
  binder.keymap(mode.NORMAL, 'B', '<NOP>')
  binder.keymap(mode.NORMAL, 'e', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<S-RIGHT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<S-LEFT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<C-RIGHT>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<C-LEFT>', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#inserting
  binder.keymap({ mode.VISUAL, mode.NORMAL }, 'I', '<NOP>')
  binder.keymap({ mode.VISUAL, mode.NORMAL }, 'A', '<NOP>')
  binder.keymap({ mode.VISUAL, mode.NORMAL }, 'O', '<NOP>')
  binder.keymap({ mode.VISUAL, mode.NORMAL }, 'o', '<NOP>')
  binder.keymap(mode.NORMAL, 'a', '<NOP>')
  binder.keymap({ mode.VISUAL, mode.NORMAL }, 'i', '<NOP>')

  -- https://neovim.io/doc/user/scroll.html#scroll-down
  binder.keymap(mode.NORMAL, '<C-e>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-d>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-f>', '<NOP>')

  -- https://neovim.io/doc/user/scroll.html#scroll-up
  binder.keymap(mode.NORMAL, '<C-y>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-u>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-b>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<S-UP>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.INSERT }, '<S-DOWN>', '<NOP>')

  -- https://neovim.io/doc/user/change.html#deleting
  binder.keymap(mode.VISUAL, '<C-H>', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'x', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'X', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'd', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'D', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'J', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'gJ', '<NOP>')

  -- https://neovim.io/doc/user/change.html#delete-insert
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'c', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'C', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 's', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'S', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'R', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'r', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'gR', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'gr', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#object-select
  binder.keymap(mode.NORMAL, '(', '<NOP>')
  binder.keymap(mode.NORMAL, ')', '<NOP>')
  binder.keymap(mode.NORMAL, '{', '<NOP>')
  binder.keymap(mode.NORMAL, '}', '<NOP>')
  binder.keymap(mode.NORMAL, ']]', '<NOP>')
  binder.keymap(mode.NORMAL, '[[', '<NOP>')
  binder.keymap(mode.NORMAL, '[]', '<NOP>')
  binder.keymap(mode.NORMAL, '][', '<NOP>')
  binder.keymap(mode.VISUAL, 'ip', '<NOP>')
  binder.keymap(mode.VISUAL, 'i\'', '<NOP>')
  binder.keymap(mode.VISUAL, 'a\'', '<NOP>')
  binder.keymap(mode.VISUAL, 'ap', '<NOP>')

  -- https://neovim.io/doc/user/cmdline.html#cmdline-editing
  binder.keymap(mode.COMMAND, '<C-K>', '<NOP>')
  binder.keymap(mode.COMMAND, '<C-J>', '<NOP>')
  binder.keymap(mode.COMMAND, '<C-H>', '<NOP>')
  binder.keymap(mode.NORMAL, ':', '<NOP>')

  -- https://neovim.io/doc/user/cmdline.html#cmdline-completion
  binder.keymap(mode.COMMAND, '<C-L>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#mark-motions
  binder.keymap(mode.NORMAL, '\'', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#ins-completion
  binder.keymap(mode.INSERT, '<C-X>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-P>', '<NOP>')

  -- https://neovim.io/doc/user/windows.html
  binder.keymap(mode.NORMAL, '<C-w>', '<NOP>')

  -- https://neovim.io/doc/user/tagsrch.html#tag-stack
  binder.keymap(mode.NORMAL, '<C-t>', '<NOP>')

  -- https://neovim.io/doc/user/various.html#various-cmds
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'K', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, '<C-L>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#jump-motions
  binder.keymap(mode.NORMAL, '<C-O>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-I>', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#ins-special-special
  binder.keymap(mode.INSERT, '<C-G>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-O>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#various-motions
  binder.keymap(mode.NORMAL, 'H', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'L', '<NOP>')
  binder.keymap(mode.NORMAL, 'M', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#ins-special-keys
  binder.keymap(mode.INSERT, '<C-J>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-K>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-H>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-r>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-d>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-t>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-f>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-y>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-u>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-b>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-w>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-i>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-S-i>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-[>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-{>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-[>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-]>', '<NOP>')

  -- https://neovim.io/doc/user/vimindex.html#%5B
  binder.keymap(mode.NORMAL, '[', '<NOP>')
  binder.keymap(mode.NORMAL, ']', '<NOP>')

  -- https://neovim.io/doc/user/vimindex.html#g
  binder.keymap(mode.NORMAL, 'g', '<NOP>')

  -- https://neovim.io/doc/user/visual.html#Select
  binder.keymap(mode.VISUAL, '<C-O>', '<NOP>')

  -- https://neovim.io/doc/user/visual.html#visual-change
  binder.keymap(mode.VISUAL, 'O', '<NOP>')
  binder.keymap(mode.VISUAL, 'o', '<NOP>')

  -- https://neovim.io/doc/user/map.html#%3Amap-alt-keys
  binder.keymap(mode.INSERT, '<A-;>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-o>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-l>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-k>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-i>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-u>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-j>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-p>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-\'>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-Enter>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-backspace>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-O>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-L>', '<NOP>')

  -- https://neovim.io/doc/user/change.html#copy-move
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'p', '<NOP>')
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'P', '<NOP>')

  -- https://neovim.io/doc/user/tagsrch.html#tag-commands
  binder.keymap(mode.NORMAL, '<C-]>', '<NOP>')

  -- https://neovim.io/doc/user/change.html#complex-change
  binder.keymap(mode.NORMAL, '=', '<NOP>')

  -- https://neovim.io/doc/user/pattern.html#search-commands
  binder.keymap(mode.NORMAL, '?', '<NOP>')
  binder.keymap(mode.NORMAL, 'n', '<NOP>')
  binder.keymap(mode.NORMAL, 'N', '<NOP>')

  -- https://neovim.io/doc/user/change.html#shift-left-right
  binder.keymap(mode.NORMAL, '<', '<NOP>')
  binder.keymap(mode.NORMAL, '>', '<NOP>')

  -- 还不知道
  binder.keymap(mode.INSERT, '<C-l>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-;>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-\'>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-S-[>', '<NOP>')
  binder.keymap({ mode.INSERT, mode.NORMAL }, '<C-S-p>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-A-p>', '<NOP>')
  binder.keymap(mode.INSERT, '<C-A-l>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-">', '<NOP>')
  binder.keymap(mode.INSERT, '<A-:>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-P>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-{>', '<NOP>')
  binder.keymap(mode.INSERT, '<A-}>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-S-e>', '<NOP>')
  binder.keymap(mode.NORMAL, '<C-S-d>', '<NOP>')
end)

-- 移除临时 keymap
events.rg(event_name.BUFFER_READ, function ()
  logger.info('hello,world')
  -- https://neovim.io/doc/user/insert.html#inserting
  binder.keymap(mode.VISUAL, 'a', '<NOP>', { buffer = true })
end)

-- 绑定全局 keymap
events.rg(event_name.VIM_ENTER, function ()
  -- 由于 <C-[> 与 <ESC> 的含义是相同的，当禁用了 <C-[> 后需要重新再映射一次 <ESC> 键
  binder.keymap(mode.INSERT, '<ESC>', '<ESC>', { remap = false })

  -- 进入 insert 模式
  binder.keymap(mode.NORMAL, 'a', 'a', { remap = false })

  -- Left-Right-Up-Down montions
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'l', 'h', { remap = false })
  binder.keymap({ mode.NORMAL, mode.VISUAL }, '\'', 'l', { remap = false })
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'p', 'k', { remap = false })
  binder.keymap({ mode.NORMAL, mode.VISUAL }, ';', 'j', { remap = false })
  binder.keymap(mode.INSERT, '<A-l>', '<C-o>h', { remap = false })
  binder.keymap(mode.INSERT, '<A-\'>', '<C-o>l', { remap = false })
  binder.keymap(mode.INSERT, '<A-p>', '<C-o>k', { remap = false })
  binder.keymap(mode.INSERT, '<A-;>', '<C-o>j', { remap = false })
  binder.keymap(mode.NORMAL, '<S-p>', '<C-y>', { remap = false })
  binder.keymap(mode.NORMAL, ':', '<C-e>', { remap = false })

  -- word montions
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'w', function()
    local line = vim.fn.getline('.')
    local max = vim.fn.strcharlen(line)

    if max == 0 then
      return 'w'
    end

    local _, _, col, _, _ = tool.tbl_unpack(vim.fn.getcursorcharpos(0))
    if (col >= max) then
      return 'w'
    else
      return 'e'
    end
  end, { expr = true, remap = false })
  binder.keymap({ mode.NORMAL, mode.VISUAL }, 'q', 'b', { remap = false })
  binder.keymap(mode.INSERT, '<A-w>', function()
    local line = vim.fn.getline('.')
    local max = vim.fn.strcharlen(line)

    if max == 0 then
      return '<C-o>w'
    end

    local _, _, col, _, _ = tool.tbl_unpack(vim.fn.getcursorcharpos(0))
    if (col >= max) then
      return '<C-o>w'
    else
      return '<C-o>e'
    end
  end, { expr = true, remap = false })
  binder.keymap(mode.INSERT, '<A-q>', '<C-o>b', { remap = false })

  -- windows
  binder.keymap(mode.NORMAL, 'sv', '<CMD>vsp<CR>')
  binder.keymap(mode.NORMAL, 'sh', '<CMD>sp<CR>')
  binder.keymap(mode.NORMAL, 'sc', '<CMD>wincmd c<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'so', '<CMD>wincmd o<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 's=', '<CMD>vertical resize +5<CR>')
  binder.keymap(mode.NORMAL, 's-', '<CMD>vertical resize -5<CR>')
  binder.keymap(mode.NORMAL, 's0', '<CMD>horizontal resize +5<CR>')
  binder.keymap(mode.NORMAL, 's9', '<CMD>horizontal resize -5<CR>')
  binder.keymap(mode.NORMAL, 'sp', '<CMD>wincmd k<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 's;', '<CMD>wincmd j<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 'sl', '<CMD>wincmd h<CR>', { remap = false })
  binder.keymap(mode.NORMAL, 's\'', '<CMD>wincmd l<CR>', { remap = false })

  -- windows(tabline)
  binder.keymap(mode.NORMAL, 'ts', '<CMD>tab split<CR>')
  binder.keymap(mode.NORMAL, 'tc', '<CMD>tabclose<CR>')
  binder.keymap(mode.NORMAL, 't.', '<CMD>tabnext<CR>')
  binder.keymap(mode.NORMAL, 't,', '<CMD>tabprev<CR>')
  binder.keymap(mode.NORMAL, 'to', '<CMD>tabonly<CR>')

  -- cmdline
  binder.keymap(mode.NORMAL, '\\', ':', { remap = false, silent = false })

  -- search command
  binder.keymap(mode.NORMAL, '.', function()
    if vim.fn.getreg('/') ~= '' then
      tool.feedkeys('n')
    end
  end)
  binder.keymap(mode.NORMAL, ',', function()
    if vim.fn.getreg('/') ~= '' then
      tool.feedkeys('N')
    end
  end)
  binder.keymap(mode.NORMAL, '?', function()
    tool.clear_searchpattern()
    tool.clear_commandline()
  end, { remap = false })

  -- 文本删除
  binder.keymap(mode.NORMAL, 'z', 'x', { remap = false })
  binder.keymap(mode.VISUAL, 'z', 'x', { remap = false })
  binder.keymap(mode.NORMAL, 'Z', 'dd', { remap = false })
  binder.keymap(mode.NORMAL, 'x', '"_x', { remap = false })
  binder.keymap(mode.VISUAL, 'x', '"_x', { remap = false })
  binder.keymap(mode.NORMAL, 'X', '"_dd', { remap = false })

  -- 文本替换
  binder.keymap(mode.ALL, 'c', 'cl', { remap = false })
  binder.keymap(mode.VISUAL, 'c', 'c', { remap = false })
  binder.keymap(mode.NORMAL, 'C', 'cc', { remap = false })
  binder.keymap(mode.NORMAL, 'r', 'R', { remap = false })

  -- 重新映射一些键在insert模式下的行为
  binder.keymap(mode.INSERT, '<A-Enter>', '<CR>', { remap = false })
  binder.keymap(mode.INSERT, '<A-backspace>', '<BS>', { remap = false })
  binder.keymap(mode.INSERT, '<TAB>', '<C-I>', { remap = false })
end)

-- 设置临时 keymap
events.rg(event_name.BUFFER_READ, function ()
  logger.info('hello,world')
  -- 改善 <HOME> 的功能
  --  1. 当前光标所在位置前面的字符不是全部 blank space 的情况下则跳跃到第一个字符所在位置
  --  2. 当前光标所在位置前面的字符全部是 blank space 的情况下则跳跃到第一列所在位置
  binder.keymap(mode.INSERT, '<A-[>', function()
    local byteidx = vim.fn.col('.')
    local sub = string.sub(vim.fn.getline('.'), 1, (byteidx == 1 and 1 or byteidx - 1))
    return sub:match("%S") == nil and '<C-o><HOME>' or '<C-o>^'
  end, { expr = true, remap = false, buffer = true, nowait = true })
  binder.keymap(mode.NORMAL, '[', function()
    local byteidx = vim.fn.col('.')
    local sub = string.sub(vim.fn.getline('.'), 1, (byteidx == 1 and 1 or byteidx - 1))
    return sub:match("%S") == nil and '<HOME>' or '^'
  end, { expr = true, remap = false, buffer = true, nowait = true })

  -- 改善 <END> 的功能
  --  1. 在非 visual 模式下，都会直接跳转到最后一个非 blank space 字符的所在位置
  --  1. 在 visual 模式下，当前光标所在位置前面的字符全部是 blank space 的情况下则跳跃到最后一列所在位置，否则按照第一条的逻辑执行
  binder.keymap(mode.NORMAL, ']', 'g$', { remap = false, buffer = true, nowait = true })
  binder.keymap(mode.INSERT, '<A-]>', '<C-o>g$', { remap = false, buffer = true, nowait = true })
  binder.keymap(mode.VISUAL, ']', function()
    local line = vim.fn.getline('.')
    return line:match("%S") == nil and 'g$' or 'g_'
  end, { expr = true, remap = false, buffer = true, nowait = true })

  -- 进入 insert 模式
  binder.keymap(mode.VISUAL, 'a', function()
    local mode = vim.api.nvim_get_mode()['mode']

    if mode == '\22' then
      -- 列模式
      return 'I<C-o>l'
    else
      -- 行模式
      return 'A'
    end
  end, { expr = true, remap = false, nowait = true, buffer = true })
end)
------------------------------------------------------------------------------------------------