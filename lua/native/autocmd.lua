------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://neovim.io/doc/user/autocmd.html#autocmd-groups
--  2. https://neovim.io/doc/user/api.html#api-autocmd
--  3. https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local tool = require 'utils.tool'
local logger = require 'utils.log'
local events = require 'common.events'
local event_name = require 'common.events'.Name
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local group_id = vim.api.nvim_create_augroup("ngpong_global_group", { clear = true, })
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- 打开文件时自动跳到文件上一次关闭时所停留的问题
--
-- REF:
--  1. https://www.reddit.com/r/neovim/comments/ucgxmj/how_to_update_the_lastpositionjump_to_a_lua/
--  2. https://www.reddit.com/r/neovim/comments/632wh4/neovim_does_not_save_last_cursor_position/
vim.api.nvim_create_autocmd('BufReadPost', {
  group = group_id,
  pattern = { '*' },
  callback = function()
    -- don't apply to git messages
    local ft = vim.opt_local.filetype:get()
    if (ft:match('commit') or ft:match('rebase')) then
      return
    end

    -- get position of last saved edit
    local line, col = tool.tbl_unpack(vim.api.nvim_buf_get_mark(0, '"'))

    -- if in range, go there
    if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
      vim.api.nvim_win_set_cursor(0, { line, col })
    end
  end
})

-- 进入时清空 last pattern
--
-- REF:
--  1. https://neovim.io/doc/user/change.html#registers
vim.api.nvim_create_autocmd('VimEnter', {
  group = group_id,
  pattern = { '*' },
  callback = function()
    tool.clear_searchpattern()
  end
})

-- 在离开命令行后自动清理输出内容
--
-- REF:
--  1. https://unix.stackexchange.com/questions/574764/vim-automatically-clear-the-command-line
--  2. https://www.reddit.com/r/neovim/comments/130f9jk/automatically_clear_the_command_line/
--vim.api.nvim_create_autocmd('CmdlineLeave', {
--	group = group_id,
--	callback = function()
--    vim.fn.timer_start(5000, function()
--      if 'n' == vim.api.nvim_get_mode()['mode'] then
--        print('')
--      end
--		end)
--	end
--})

-- 设置颜色组
vim.api.nvim_create_autocmd('ColorScheme', {
  group = group_id,
  pattern = { '*' },
  callback = function()
    vim.api.nvim_set_hl(0, 'NGPONGHiddenCursor', { reverse = true, blend = 100 })
  end
})

-- 公共 VimEnter 事件
vim.api.nvim_create_autocmd('VimEnter', {
  group = group_id,
  pattern = { '*' },
  callback = function()
    events.emit(event_name.VIM_ENTER)
  end
})

-- 公共 BufReadPost 事件
vim.api.nvim_create_autocmd('BufReadPost', {
  group = group_id,
  pattern = { '*' },
  callback = function()
    events.emit(event_name.BUFFER_READ)
  end
})
------------------------------------------------------------------------------------------------