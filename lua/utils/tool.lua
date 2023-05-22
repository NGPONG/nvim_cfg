local M = {}

local logger = require('utils.log')

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

function M.tbl_r_extend(...)
   return vim.tbl_extend('force', ...)
end

function M.tbl_r_deepextend(...)
   return vim.tbl_deep_extend('force', ...)
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
   if not M.ishide_cursor() then
      if vim.o.termguicolors and vim.o.guicursor ~= "" then
         M.guicursor = vim.o.guicursor
         vim.o.guicursor = "a:NGPONGHiddenCursor"
      end
   end
end

function M.unhide_cursor()
   if M.ishide_cursor() then
      vim.o.guicursor = M.guicursor
   end
end

function M.feedkeys(key)
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), 'n', false)
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

return M
