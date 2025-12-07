vim.keymap.set('n', '<Leader>v', ':execute "silent pedit +" . line(".") . "\\|normal\\\\ zt %"<cr>')
vim.keymap.set('n', '<Leader>c', ':pclose<cr>')
vim.keymap.set('n', '<C-w>r', ':resize 10<cr>')
