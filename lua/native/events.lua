local M = {}

local logger = require 'utils.log'

function M.rg_on_buffer_read(fn)
  M.on_buffer_read_handlers = M.on_buffer_read_handlers or {}
  table.insert(M.on_buffer_read_handlers, fn)
end
function M.do_on_buffer_read()
  for i, fn in pairs(M.on_buffer_read_handlers or {}) do
    local status, err = pcall(fn)
    if status == false then
      logger.info(err)
    end
  end
end

function M.rg_on_nvim_enter(fn)
  M.on_nvim_enter_handlers = M.on_nvim_enter_handlers or {}
  table.insert(M.on_nvim_enter_handlers, fn)
end
function M.do_on_nvim_enter()
  for i, fn in pairs(M.on_nvim_enter_handlers or {}) do
    local status, err = pcall(fn)
    if status == false then
      logger.info(err)
    end
  end
end

function M.rg_on_tree_setup(fn)
  M.on_tree_setup_handlers = M.on_tree_setup_handlers or {}
  table.insert(M.on_tree_setup_handlers, fn)
end
function M.do_on_tree_setup(bufnr)
  for i, fn in pairs(M.on_tree_setup_handlers or {}) do
    local status, err = pcall(fn, bufnr)
    if status == false then
      logger.info(err)
    end
  end
end

function M.rg_on_open_tree(fn)
  M.on_open_tree_handlers = M.on_open_tree_handlers or {}
  table.insert(M.on_open_tree_handlers, fn)
end
function M.do_on_open_tree()
  for i, fn in pairs(M.on_open_tree_handlers or {}) do
    local status, err = pcall(fn)
    if status == false then
      logger.info(err)
    end
  end
end

function M.rg_on_close_tree(fn)
  M.on_close_tree_handlers = M.on_close_tree_handlers or {}
  table.insert(M.on_close_tree_handlers, fn)
end
function M.do_on_close_tree()
  for i, fn in pairs(M.on_close_tree_handlers or {}) do
    local status, err = pcall(fn)
    if status == false then
      logger.info(err)
    end
  end
end

function M.rg_on_open_diffview(fn)
  M.on_open_diffview_handlers = M.on_open_diffview_handlers or {}
  table.insert(M.on_open_diffview_handlers, fn)
end
function M.do_on_open_diffview()
  for i, fn in pairs(M.on_open_diffview_handlers or {}) do
    local status, err = pcall(fn)
    if status == false then
      logger.info(err)
    end
  end
end

function M.rg_on_close_diffview(fn)
  M.on_close_diffview_handlers = M.on_close_diffview_handlers or {}
  table.insert(M.on_close_diffview_handlers, fn)
end
function M.do_on_close_diffview()
  for i, fn in pairs(M.on_close_diffview_handlers or {}) do
    local status, err = pcall(fn)
    if status == false then
      logger.info(err)
    end
  end
end

return M