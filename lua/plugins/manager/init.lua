------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/wbthomason/packer.nvim

-- commands:
--  :PackerCompile   Regenerate compiled loader file
--  :PackerClean     Remove any disabled or unused plugins
--  :PackerInstall   Clean, then install missing plugins
--  :PackerUpdate    Clean, then update and install plugins
--  :PackerSync      Perform `PackerUpdate` and then `PackerCompile`
--  :PackerStatus    Show list of installed plugins
------------------------------------------------------------------------------------------------

local M = {}

------------------------------------------------------------------------------------------------
local packer = require('packer')
local logger = require('utils.log')
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
function M.init()
  M.define(function(use)
    use {
      'wbthomason/packer.nvim',
    }
  end)

  packer.reset()
  packer.init({
    -- 是否在sync的时候执行compile
    compile_on_sync = true,
    -- 并发数限制
    max_jobs = 16,
    -- 使用浮动窗口
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
    -- 用于观察插件执行时间的配置 PackerProfile
    profile = {
      enable = true,
      threshold = 0
    }
  })
end

function M.define(fn)
  M.defines = M.defines or {}
  table.insert(M.defines, fn)
end

function M.setup(fn)
  M.setups = M.setups or {}
  table.insert(M.setups, fn)
end

function M.laungh()
  pcall(require('packer').startup, function (use)
    for i, fn in pairs(M.defines or {}) do
      local status, err = pcall(fn, use)
      if status == false then
        logger.info(err)
      end
    end

    for i, fn in pairs(M.setups or {}) do
      local status, err = pcall(fn, use)
      if status == false then
        logger.info(err)
      end
    end
  end)
end
------------------------------------------------------------------------------------------------

return M