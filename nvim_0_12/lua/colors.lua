vim.opt.termguicolors = true
vim.g.everforest_background = 'hard'
vim.g.everforest_dim_inactive_windows = '0'
vim.g.everforest_sign_column_background = 'grey'
vim.g.everforest_ui_contrast = 'high'
vim.g.everforest_diagnostic_virtual_text = 'colored'
vim.g.everforest_enable_italic = false
vim.g.everforest_transparent_background = 1
-- vim.g.everforest_inlay_hints_background = 'dimmed'

vim.cmd.colorscheme('everforest')
vim.opt.background = "light"

vim.api.nvim_set_hl(0, "CursorLine", {bg = "#dfdfdf"})
vim.api.nvim_set_hl(0, "MatchParen", {bg = "#a0a0a0"})
-- vim.api.nvim_set_hl(0, "Normal", {bg = "#ffffff"})
vim.g.vim_json_conceal = 0
