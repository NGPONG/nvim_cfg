------------------------------------------------------------------------------------------------
vim.g.neo_tree_remove_legacy_commands = 1

vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", { text = "󰰁 ", texthl = "DiagnosticSignHint" })

vim.api.nvim_set_hl(0, 'NeoTreeGitConflict', { italic = false, bold = true, fg = '#b16283' })
vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { italic = false, bold = true, fg = '#e87d05' })
vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { italic = false, fg = '#e87d05' })
------------------------------------------------------------------------------------------------