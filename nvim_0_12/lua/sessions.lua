vim.opt.sessionoptions:append('globals')
vim.keymap.set('n', '<Leader>s', ':mksession!<CR>:wshada<CR>')
vim.opt.shada = {'!', '\'200', '<1000', 's100', 'f1', 'n$PWD/Shada.vim'}
