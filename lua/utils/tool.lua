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
