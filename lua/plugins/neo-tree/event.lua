------------------------------------------------------------------------------------------------
local events = require 'common.events'
local event_name = require 'common.events'.Name
local logger = require 'utils.log'
local tools = require 'utils.tool'
local autocmd = require 'plugins.neo-tree.autocmd'
local keymap = require 'plugins.neo-tree.keys'
local async = require 'plenary.async'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local await_schedule = async.util.scheduler
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
events.rg(event_name.OPEN_TREE, async.void(function(_)
  autocmd.set_donot_used_cursor_autocmds()
end))

events.rg(event_name.CLOSE_TREE, async.void(function(_)
  autocmd.del_all_autocmds()
end))

events.rg(event_name.VIM_ENTER, async.void(function()
  keymap.del_native_keymaps()
  keymap.set_native_keymaps()
end))

events.rg(event_name.SETUP_TREE, async.void(function(cfg)
  local keymap_remove_cfg = {
    window = {
      mapping_options = keymap.mapping_opts(),
      mappings = keymap.del_neotree_keymaps(),
    },
  }

  local keymap_rebind_cfg = {
    window = {
      mapping_options = keymap.mapping_opts(),
      mappings = keymap.set_neotree_keymaps(),
    },
    filesystem = {
      window = {
        mapping_options = keymap.mapping_opts(),
        mappings = keymap.set_filesys_keymaps(),
      }
    }
  }

  local fix942_cfg = {
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/942
    git_status_async = false,
    filesystem = {
      async_directory_scan = "never",
    },
  }

  local fix337_cfg = {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/337
    enable_git_status = true,
    filesystem = {
      use_libuv_file_watcher = true,
    },
  }

  local fixicon_cfg = {
    default_component_configs = {
      indent = {
        indent_marker = "│",
        last_indent_marker = "└",
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
      },
      modified = {
        symbol = "",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- this can only be used in the git_status source
          renamed   = "󰁕",-- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
    },
    document_symbols = {
      kinds = {
        File = { icon = "󰈙", hl = "Tag" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Property = { icon = "󰆧", hl = "@property" },
        Enum = { icon = "󰒻", hl = "@number" },
        Function = { icon = "󰊕", hl = "Function" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Struct = { icon = "󰌗", hl = "Type" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
        StaticMethod = { icon = '󰠄 ', hl = 'Function' },
      }
    },
  }

  tools.tbl_r_extend(cfg, keymap_remove_cfg,
                          keymap_rebind_cfg,
                          fix337_cfg,
                          --fix942_cfg,
                          fixicon_cfg)
end))
------------------------------------------------------------------------------------------------