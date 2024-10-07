-- for old time sake
vim.keymap.set("n", "<c-P>", require('fzf-lua').files)

-- 'ü' will be our prefix
vim.keymap.set("n", "üf", require('fzf-lua').files)
vim.keymap.set("n", "üü", require('fzf-lua').builtin)
vim.keymap.set("n", "üb", require('fzf-lua').buffers)
vim.keymap.set("n", "üc", require('fzf-lua').quickfix)
vim.keymap.set("n", "ül", require('fzf-lua').loclist)
vim.keymap.set("n", "üt", require('fzf-lua').tabs)
vim.keymap.set("n", "üa", require('fzf-lua').args)
vim.keymap.set("n", "ür", require('fzf-lua').resume)
vim.keymap.set("n", "üm", require('fzf-lua').marks)
vim.keymap.set("n", "üj", require('fzf-lua').jumps)
vim.keymap.set("n", "ü\"", require('fzf-lua').registers)

