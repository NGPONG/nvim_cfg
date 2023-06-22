local logger = require 'utils.log'
local tools = require 'utils.tool'

local async = require 'plenary.async'

logger.info('----------------------begin----------------------')

--local stat = 0
--local saved_arg
--
--require('utils.log').info('1 ' .. vim.inspect(coroutine.running()))
--
--local wrapped = async.wrap(function(inc, callback)
--  --require('utils.log').info('3 ' .. vim.inspect(coroutine.running()))
--  
--  stat = stat + inc
--  --callback()
--end, 2)
--
--local voided = async.void(function(arg)
--  require('utils.log').info('haha: ' .. vim.inspect(coroutine.running()))
--  wrapped(1)
--  --require('utils.log').info('4 ' .. vim.inspect(coroutine.running()))
--  --wrapped(2)
--  --require('utils.log').info('5 ' .. vim.inspect(coroutine.running()))
--  --wrapped(3)
--  --require('utils.log').info('6 ' .. vim.inspect(coroutine.running()))
--  stat = stat + 1
--  saved_arg = arg
--end)
--
--voided "hello"

-- local read_file = async.void(function(arg)
--     require('utils.log').info('begin to execute fs_open: ' .. vim.inspect(coroutine.running()))
--     local err, fd = async.uv.fs_open(arg, "r", 438)
--     assert(not err, err)
--     require('utils.log').info('end of execute fs_open: ' .. vim.inspect(coroutine.running()))
--     require('utils.log').info(debug.traceback())
--     --require('utils.log').info('2' .. vim.inspect(coroutine.running()))
-- 
--     local err, stat = async.uv.fs_fstat(fd)
--     assert(not err, err)
-- 
--     --require('utils.log').info(vim.inspect(coroutine.running()))
-- 
--     local err, data = async.uv.fs_read(fd, stat.size, 0)
--     assert(not err, err)
-- 
--     --require('utils.log').info(vim.inspect(coroutine.running()))
-- 
--     local err = async.uv.fs_close(fd)
--     assert(not err, err)
-- 
--     --require('utils.log').info(vim.inspect(coroutine.running()))
-- 
--     return data
-- end)
-- 
-- read_file('/home/ngpong/neovim/12')

--local read_file = async.void(function(arg)
--    require('utils.log').info(vim.inspect(coroutine.running()))
--
--    local err, fd = async.uv.fs_open(arg, "r", 438)
--    assert(not err, err)
--
--    require('utils.log').info(vim.inspect(coroutine.running()))
--
--    local err, stat = async.uv.fs_fstat(fd)
--    assert(not err, err)
--
--    require('utils.log').info(vim.inspect(coroutine.running()))
--
--    local err, data = async.uv.fs_read(fd, stat.size, 0)
--    assert(not err, err)
--
--    require('utils.log').info(vim.inspect(coroutine.running()))
--
--    local err = async.uv.fs_close(fd)
--    assert(not err, err)
--
--    require('utils.log').info(vim.inspect(coroutine.running()))
--
--    return data
--end)
--
--read_file('/home/ngpong/neovim/12')

--local function test_1(...)
--  require('utils.log').info({...})
--end
--
--local function test_2(...)
--  require('utils.log').info({...})
--  test_1(select(2, ...))
--end
--
--test_2(1,2,3,4,5,6,7,8,9)

--logger.info('1')
--
--logger.info(tools.cur_thread())
--
--async.void(function(arg)
--    logger.info(tools.cur_thread())
--    logger.info('2')
--
--    async.util.scheduler()
--
--    logger.info(tools.cur_thread())
--
--    logger.info('3')
--end)()
--
--logger.info(tools.cur_thread())
--
--
--logger.info('4')

-- for _ = 1, 10 do
--     logger.info('hello,world')
-- end

local condvar = async.control.Condvar.new()

async.run(function()
    logger.info(1)

    condvar:wait()

    logger.info(2)
end)

async.run(function()
    logger.info(3)

    condvar:wait()

    logger.info(4)
end)

logger.info('begin notify')

condvar:notify_all()

logger.info('end notify')

async.run(function()
    logger.info(5)

    condvar:wait()

    logger.info(6)
end)

logger.info('begin notify')

condvar:notify_all()

logger.info('end notify')


logger.info('----------------------end----------------------')