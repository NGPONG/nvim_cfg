local M = {}

------------------------------------------------------------------------------------------------
local logger = require('utils.log')
local async = require 'plenary.async'
local await_schedule = require 'plenary.async'.util.scheduler
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
function M.tbl_dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k, v in pairs(o) do
         if type(k) ~= 'number' then k = '"' .. k .. '"' end
         s = s .. '[' .. k .. '] = ' .. M.tbl_dump(v) .. ', '
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function M.equal(lhs, rhs)
   return vim.deep_equal(lhs, rhs)
end

function M.tbl_rr_extend(...)
   return vim.tbl_deep_extend('force', ...)
end

function M.tbl_r_extend(org, ...)
   local function can_merge(v)
      return type(v) == 'table' and (vim.tbl_isempty(v) or not vim.tbl_isarray(v))
   end

   if select('#', ...) <= 0 then
      return
   end

   for i = 1, select('#', ...) do
     local tbl = select(i, ...)
     if tbl then
       for k, v in pairs(tbl) do
         if can_merge(v) and can_merge(org[k]) then
           M.tbl_r_extend(org[k], v)
         else
           org[k] = v
         end
       end
     end
   end
end

function M.tbl_unpack(t)
   local fn = table.unpack or unpack
   return fn(t)
end

function M.curpath()
   return vim.fn.expand('%:p:h')
end

function M.curpath_exist(path)
   return string.find(M.curpath(), path)
end

function M.clear_commandline()
   vim.fn.feedkeys(':', 'nx')
end

function M.clear_searchpattern()
   vim.fn.setreg('/', {})
end

function M.ishide_cursor()
   if vim.o.guicursor == "a:NGPONGHiddenCursor" then
      return true
   else
      return false
   end
end

function M.hide_cursor()
   async.run(function ()
      await_schedule()

      if not M.ishide_cursor() then
         if vim.o.termguicolors and vim.o.guicursor ~= "" then
            M.guicursor = vim.o.guicursor
            vim.o.guicursor = "a:NGPONGHiddenCursor"
         end
      end
   end)
end

function M.unhide_cursor()
   async.run(function ()
      await_schedule()

      if M.ishide_cursor() then
         vim.o.guicursor = M.guicursor
      end
   end)
end

function M.is_cursor_hide()
   return vim.o.guicursor == "a:NGPONGHiddenCursor"
end

function M.feedkeys(key)
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), 'n', false)
end

function M.get_bufnr(_)
   return vim.api.nvim_get_current_buf and vim.api.nvim_get_current_buf() or vim.fn.bufnr()
end

function M.get_tabnr(_)
   return vim.api.nvim_get_current_tabpage()
end

function M.get_win_list(...)
   local args = {...}
   return next(args) and vim.api.nvim_tabpage_list_wins(args[1]) or vim.api.nvim_tabpage_list_wins(0)
end

function M.get_buf_list(...)
   local args = {...}

   local tabnr = next(args) and args[1] or -1
   if tabnr > 0 then
      
   else
      return M.get_loaded_bufs()
   end
end

function M.get_buf_name(...)
   local args = {...}
   return next(args) and vim.api.nvim_buf_get_name(args[1]) or vim.api.nvim_buf_get_name(0)
end

function M.get_loaded_bufs()
   local bufs_loaded = {}

   for i, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
       if vim.api.nvim_buf_is_loaded(buf_hndl) then
           bufs_loaded[i] = buf_hndl
       end
   end

   return bufs_loaded
end

function M.enum(t)
   vim.tbl_add_reverse_lookup(t)
   return t
end

function M.cur_thread()
   return coroutine.running()
end

function M.tostring(key)
   return vim.inspect(key)
end

function M.hide_bufline()
   vim.go.showtabline = 0
end

function M.show_bufline()
   vim.go.showtabline = 2
end

-- local lastinput_key = ''
-- local lastrelease_key = ''
-- vim.on_key(function(key)
--    vim.schedule(function()
--       lastrelease_key = lastinput_key
--       if (lastrelease_key == nil or lastrelease_key == '') then
--          lastrelease_key = key
--       end
-- 
--       lastinput_key = key
-- 	end)
-- end)
-- function M.get_lastinput_key()
--    return lastinput_key
-- end
-- function M.get_lastrelease_key()
--    return lastrelease_key
-- end
------------------------------------------------------------------------------------------------

return M
