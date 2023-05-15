------------------------------------------------------------------------------------------------
local tool = require 'utils.tool'
local binder = require 'utils.keybinder'
local logger = require 'utils.log'
local events = require 'native.events'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- 移除全局 keymap
events.rg_on_nvim_enter(function ()
  -- https://neovim.io/doc/user/repeat.html#complex-repeat
  binder.keymap(binder.E_NORMAL, 'q', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'Q', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#left-right-motions
  binder.keymap(binder.E_NORMAL, '$', '<NOP>')
  binder.keymap(binder.E_NORMAL, '0', '<NOP>')
  binder.keymap(binder.E_NORMAL, '^', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'h', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'l', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-H>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<SPACE>', '<NOP>')
  binder.keymap(binder.E_NORMAL, 't', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'T', '<NOP>')
  binder.keymap(binder.E_NORMAL, ';', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<A-LEFT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<A-RIGHT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<RIGHT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<LEFT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<C-S-RIGHT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<C-S-LEFT>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#up-down-motions
  binder.keymap(binder.E_NORMAL, 'j', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'k', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-P>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '+', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<C-J>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<C-UP>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<A-UP>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<C-DOWN>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<A-DOWN>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<UP>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<DOWN>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<C-S-UP>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT, binder.E_VISUAL }, '<C-S-DOWN>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#word-motions
  binder.keymap(binder.E_NORMAL, 'w', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'W', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'E', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'b', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'B', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'e', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<S-RIGHT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<S-LEFT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<C-RIGHT>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<C-LEFT>', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#inserting
  binder.keymap({ binder.E_VISUAL, binder.E_NORMAL }, 'I', '<NOP>')
  binder.keymap({ binder.E_VISUAL, binder.E_NORMAL }, 'A', '<NOP>')
  binder.keymap({ binder.E_VISUAL, binder.E_NORMAL }, 'O', '<NOP>')
  binder.keymap({ binder.E_VISUAL, binder.E_NORMAL }, 'o', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'a', '<NOP>')
  binder.keymap({ binder.E_VISUAL, binder.E_NORMAL }, 'i', '<NOP>')

  -- https://neovim.io/doc/user/scroll.html#scroll-down
  binder.keymap(binder.E_NORMAL, '<C-e>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-d>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-f>', '<NOP>')

  -- https://neovim.io/doc/user/scroll.html#scroll-up
  binder.keymap(binder.E_NORMAL, '<C-y>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-u>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-b>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<S-UP>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_INSERT }, '<S-DOWN>', '<NOP>')

  -- https://neovim.io/doc/user/change.html#deleting
  binder.keymap(binder.E_VISUAL, '<C-H>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'x', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'X', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'd', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'D', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'J', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'gJ', '<NOP>')

  -- https://neovim.io/doc/user/change.html#delete-insert
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'c', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'C', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 's', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'S', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'R', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'r', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'gR', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'gr', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#object-select
  binder.keymap(binder.E_NORMAL, '(', '<NOP>')
  binder.keymap(binder.E_NORMAL, ')', '<NOP>')
  binder.keymap(binder.E_NORMAL, '{', '<NOP>')
  binder.keymap(binder.E_NORMAL, '}', '<NOP>')
  binder.keymap(binder.E_NORMAL, ']]', '<NOP>')
  binder.keymap(binder.E_NORMAL, '[[', '<NOP>')
  binder.keymap(binder.E_NORMAL, '[]', '<NOP>')
  binder.keymap(binder.E_NORMAL, '][', '<NOP>')
  binder.keymap(binder.E_VISUAL, 'ip', '<NOP>')
  binder.keymap(binder.E_VISUAL, 'i\'', '<NOP>')
  binder.keymap(binder.E_VISUAL, 'a\'', '<NOP>')
  binder.keymap(binder.E_VISUAL, 'ap', '<NOP>')

  -- https://neovim.io/doc/user/cmdline.html#cmdline-editing
  binder.keymap(binder.E_COMMAND, '<C-K>', '<NOP>')
  binder.keymap(binder.E_COMMAND, '<C-J>', '<NOP>')
  binder.keymap(binder.E_COMMAND, '<C-H>', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_NORMAL }, ':', '<NOP>')

  -- https://neovim.io/doc/user/cmdline.html#cmdline-completion
  binder.keymap(binder.E_COMMAND, '<C-L>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#mark-motions
  binder.keymap(binder.E_NORMAL, '\'', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#ins-completion
  binder.keymap(binder.E_INSERT, '<C-X>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-P>', '<NOP>')

  -- https://neovim.io/doc/user/windows.html
  binder.keymap(binder.E_NORMAL, '<C-w>', '<NOP>')

  -- https://neovim.io/doc/user/tagsrch.html#tag-stack
  binder.keymap(binder.E_NORMAL, '<C-t>', '<NOP>')

  -- https://neovim.io/doc/user/various.html#various-cmds
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'K', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, '<C-L>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#jump-motions
  binder.keymap(binder.E_NORMAL, '<C-O>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-I>', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#ins-special-special
  binder.keymap(binder.E_INSERT, '<C-G>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-O>', '<NOP>')

  -- https://neovim.io/doc/user/motion.html#various-motions
  binder.keymap(binder.E_NORMAL, 'H', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'L', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'M', '<NOP>')

  -- https://neovim.io/doc/user/insert.html#ins-special-keys
  binder.keymap(binder.E_INSERT, '<C-J>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-K>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-H>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-r>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-d>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-t>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-f>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-y>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-u>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-b>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-w>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-i>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-S-i>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-[>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-{>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-[>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-]>', '<NOP>')

  -- https://neovim.io/doc/user/vimindex.html#%5B
  binder.keymap(binder.E_NORMAL, '[', '<NOP>')
  binder.keymap(binder.E_NORMAL, ']', '<NOP>')

  -- https://neovim.io/doc/user/vimindex.html#g
  binder.keymap(binder.E_NORMAL, 'g', '<NOP>')

  -- https://neovim.io/doc/user/visual.html#Select
  binder.keymap(binder.E_VISUAL, '<C-O>', '<NOP>')

  -- https://neovim.io/doc/user/visual.html#visual-change
  binder.keymap(binder.E_VISUAL, 'O', '<NOP>')
  binder.keymap(binder.E_VISUAL, 'o', '<NOP>')

  -- https://neovim.io/doc/user/map.html#%3Amap-alt-keys
  binder.keymap(binder.E_INSERT, '<A-;>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-o>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-l>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-k>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-i>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-u>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-j>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-p>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-\'>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-Enter>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-backspace>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-O>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-L>', '<NOP>')

  -- https://neovim.io/doc/user/change.html#copy-move
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'p', '<NOP>')
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'P', '<NOP>')

  -- https://neovim.io/doc/user/tagsrch.html#tag-commands
  binder.keymap(binder.E_NORMAL, '<C-]>', '<NOP>')

  -- https://neovim.io/doc/user/change.html#complex-change
  binder.keymap(binder.E_NORMAL, '=', '<NOP>')

  -- https://neovim.io/doc/user/pattern.html#search-commands
  binder.keymap(binder.E_NORMAL, '?', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'n', '<NOP>')
  binder.keymap(binder.E_NORMAL, 'N', '<NOP>')

  -- 还不知道
  binder.keymap(binder.E_INSERT, '<C-l>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-;>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-\'>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-S-[>', '<NOP>')
  binder.keymap({ binder.E_INSERT, binder.E_NORMAL }, '<C-S-p>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-A-p>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<C-A-l>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-">', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-:>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-P>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-{>', '<NOP>')
  binder.keymap(binder.E_INSERT, '<A-}>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-S-e>', '<NOP>')
  binder.keymap(binder.E_NORMAL, '<C-S-d>', '<NOP>')
end)

-- 移除临时 keymap
events.rg_on_buffer_read(function ()
  -- https://neovim.io/doc/user/insert.html#inserting
  binder.keymap(binder.E_VISUAL, 'a', '<NOP>', { buffer = true })
end)

-- 绑定全局 keymap
events.rg_on_nvim_enter(function ()
  -- 使用 <ESC> 退出 insert 模式时，光标不会向前移一位
  binder.keymap(binder.E_INSERT, '<ESC>', function()
    return vim.fn.col('.') == 1 and '<ESC>' or '<ESC>\''
  end, { expr = true })

  -- 进入 insert 模式
  binder.keymap(binder.E_NORMAL, 'a', 'i', { remap = false })

  -- Left-Right-Up-Down montions
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'l', 'h', { remap = false })
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, '\'', 'l', { remap = false })
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'p', 'k', { remap = false })
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, ';', 'j', { remap = false })
  binder.keymap(binder.E_INSERT, '<A-l>', '<C-o>h', { remap = false })
  binder.keymap(binder.E_INSERT, '<A-\'>', '<C-o>l', { remap = false })
  binder.keymap(binder.E_INSERT, '<A-p>', '<C-o>k', { remap = false })
  binder.keymap(binder.E_INSERT, '<A-;>', '<C-o>j', { remap = false })
  binder.keymap(binder.E_NORMAL, '<S-p>', '<C-y>', { remap = false })
  binder.keymap(binder.E_NORMAL, ':', '<C-e>', { remap = false })

  -- word montions
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'w', function()
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
  binder.keymap({ binder.E_NORMAL, binder.E_VISUAL }, 'q', 'b', { remap = false })
  binder.keymap(binder.E_INSERT, '<A-w>', function()
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
  binder.keymap(binder.E_INSERT, '<A-q>', '<C-o>b', { remap = false })

  -- windows
  binder.keymap(binder.E_NORMAL, 'sv', '<CMD>vsp<CR>')
  binder.keymap(binder.E_NORMAL, 'sh', '<CMD>sp<CR>')
  binder.keymap(binder.E_NORMAL, 'sc', '<CMD>wincmd c<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'so', '<CMD>wincmd o<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 's=', '<CMD>vertical resize +5<CR>')
  binder.keymap(binder.E_NORMAL, 's-', '<CMD>vertical resize -5<CR>')
  binder.keymap(binder.E_NORMAL, 's0', '<CMD>horizontal resize +5<CR>')
  binder.keymap(binder.E_NORMAL, 's9', '<CMD>horizontal resize -5<CR>')
  binder.keymap(binder.E_NORMAL, 'sp', '<CMD>wincmd k<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 's;', '<CMD>wincmd j<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 'sl', '<CMD>wincmd h<CR>', { remap = false })
  binder.keymap(binder.E_NORMAL, 's\'', '<CMD>wincmd l<CR>', { remap = false })

  -- windows(tabline)
  binder.keymap(binder.E_NORMAL, 'ts', '<CMD>tab split<CR>')
  binder.keymap(binder.E_NORMAL, 'tc', '<CMD>tabclose<CR>')
  binder.keymap(binder.E_NORMAL, 't.', '<CMD>tabnext<CR>')
  binder.keymap(binder.E_NORMAL, 't,', '<CMD>tabprev<CR>')
  binder.keymap(binder.E_NORMAL, 'to', '<CMD>tabonly<CR>')

  -- cmdline
  binder.keymap(binder.E_NORMAL, '\\', ':', { remap = false, silent = false })

  -- search command
  binder.keymap(binder.E_NORMAL, '.', function()
    if vim.fn.getreg('/') ~= '' then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('n', true, false, true), 'n', false)
    end
  end)
  binder.keymap(binder.E_NORMAL, ',', function()
    if vim.fn.getreg('/') ~= '' then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('N', true, false, true), 'n', false)
    end
  end)
  binder.keymap(binder.E_NORMAL, '?', function()
    tool.clear_searchpattern()
    tool.clear_commandline()
  end, { remap = false })

  -- 文本删除
  binder.keymap(binder.E_NORMAL, 'z', 'x', { remap = false })
  binder.keymap(binder.E_VISUAL, 'z', 'x', { remap = false })
  binder.keymap(binder.E_NORMAL, 'Z', 'dd', { remap = false })
  binder.keymap(binder.E_NORMAL, 'x', '"_x', { remap = false })
  binder.keymap(binder.E_VISUAL, 'x', '"_x', { remap = false })
  binder.keymap(binder.E_NORMAL, 'X', '"_dd', { remap = false })

  -- 文本替换
  binder.keymap(binder.E_ALL, 'c', 'cl', { remap = false })
  binder.keymap(binder.E_VISUAL, 'c', 'c', { remap = false })
  binder.keymap(binder.E_NORMAL, 'C', 'cc', { remap = false })
  binder.keymap(binder.E_NORMAL, 'r', 'R', { remap = false })

  -- 重新映射一些键在insert模式下的行为
  binder.keymap(binder.E_INSERT, '<A-Enter>', '<CR>', { remap = false })
  binder.keymap(binder.E_INSERT, '<A-backspace>', '<BS>', { remap = false })
  binder.keymap(binder.E_INSERT, '<TAB>', '<C-I>', { remap = false })
end)

-- 设置临时 keymap
events.rg_on_buffer_read(function ()
  -- 改善 <HOME> 的功能
  --  1. 当前光标所在位置前面的字符不是全部 blank space 的情况下则跳跃到第一个字符所在位置
  --  2. 当前光标所在位置前面的字符全部是 blank space 的情况下则跳跃到第一列所在位置
  binder.keymap(binder.E_INSERT, '<A-[>', function()
    local byteidx = vim.fn.col('.')
    local sub = string.sub(vim.fn.getline('.'), 1, (byteidx == 1 and 1 or byteidx - 1))
    return sub:match("%S") == nil and '<C-o><HOME>' or '<C-o>^'
  end, { expr = true, remap = false, buffer = true, nowait = true })
  binder.keymap(binder.E_NORMAL, '[', function()
    local byteidx = vim.fn.col('.')
    local sub = string.sub(vim.fn.getline('.'), 1, (byteidx == 1 and 1 or byteidx - 1))
    return sub:match("%S") == nil and '<HOME>' or '^'
  end, { expr = true, remap = false, buffer = true, nowait = true })

  -- 改善 <END> 的功能
  --  1. 在非 visual 模式下，都会直接跳转到最后一个非 blank space 字符的所在位置
  --  1. 在 visual 模式下，当前光标所在位置前面的字符全部是 blank space 的情况下则跳跃到最后一列所在位置，否则按照第一条的逻辑执行
  binder.keymap(binder.E_NORMAL, ']', 'g$', { remap = false, buffer = true, nowait = true })
  binder.keymap(binder.E_INSERT, '<A-]>', '<C-o>g$', { remap = false, buffer = true, nowait = true })
  binder.keymap(binder.E_VISUAL, ']', function()
    local line = vim.fn.getline('.')
    return line:match("%S") == nil and 'g$' or 'g_'
  end, { expr = true, remap = false, buffer = true, nowait = true })

  -- 进入 insert 模式
  binder.keymap(binder.E_VISUAL, 'a', function()
    local mode = vim.api.nvim_get_mode()['mode']

    if mode == '\22' then
      return 'I'
    else
      return 'A<C-o>h'
    end
  end, { expr = true, remap = false, nowait = true, buffer = true })
end)
------------------------------------------------------------------------------------------------