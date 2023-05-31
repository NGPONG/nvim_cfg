------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://github.com/nvim-lualine/lualine.nvim
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local logger = require 'utils.log'
local tools = require 'utils.tool'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {     -- Filetypes to disable lualine for.
      statusline = {},         -- only ignores the ft for statusline.
      winbar = {},             -- only ignores the ft for winbar.
    },
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  sections = {
    lualine_a = {
      {
        function ()
          return '🐂'
        end,
        padding = {
          left = 1,
          right = 0,
        },
      },
      {
        'mode',
        padding = {
          left = 1,
          right = 1,
        },
      },
    },
    lualine_b = {

    },
    lualine_c = {
      {
        'branch',
        padding = {
          left = 1,
          right = 1,
        },
        color = { fg = require("gruvbox.palette").get_base_colors(vim.o.background, 'soft').neutral_purple, gui = 'bold' },
        icon = ''
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
        padding = {
          left = 0,
          right = 1,
        },
      },
      {
        'diagnostics',
        diagnostics_color = {
          color_error = {
            fg = "#ec5f67"
          },
          color_info = {
            fg = "#008080"
          },
          color_warn = {
            fg = "#ECBE7B"
          }
        },
        sources = { "nvim_diagnostic" },
        symbols = {
          error = " ",
          info = " ",
          warn = " "
        }
      },
      {
        function()
          return '%='
        end,
      },
      {
        function()
          local msg = 'No Active Lsp'
          local clients = vim.lsp.get_active_clients()
          for _, client in ipairs(next(clients) and clients or {}) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = { fg = require("gruvbox.palette").get_base_colors(vim.o.background, 'soft').gray, gui = 'bold' },
      }
    },
    lualine_x = {
      {
        'filetype',
        padding = {
          left = 1,
          right = 0,
        },
        cond = function () return vim.bo.filetype ~= '' and vim.opt.fileencoding:get() ~= '' end
      },
      {
        function ()
          return '|'
        end,
        padding = {
          left = 1,
          right = 1,
        },
        cond = function () return vim.bo.filetype ~= '' and vim.opt.fileencoding:get() ~= '' end
      },
      {
        'encoding',
        padding = {
          left = 0,
          right = 1,
        },
        cond = function () return vim.bo.filetype ~= '' and vim.opt.fileencoding:get() ~= '' end
      }
    },
    lualine_y = {
    },
    lualine_z = {
      {
        'location',
        padding = {
          left = 1,
          right = 0,
        },
      },
      {
        'progress',
        padding = {
          left = 0,
          right = 0,
        },
      },
      {
        function ()
          return ''
        end,
        padding = {
          left = 1,
          right = 1,
        },
      },
    }
  },
  extensions = {'neo-tree'}
}
-------------------------------------------------------------------------------------