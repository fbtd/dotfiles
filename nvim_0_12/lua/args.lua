EchoArgs = require"echoargs"

for i = 0, 9 do
    vim.keymap.set('n', '<leader>' .. i, ':' .. i .. 'argu<CR>:lua EchoArgs.echo()<CR>')
end

vim.keymap.set('n', '<leader>a', ':argadd<CR>:argdedupe<CR>:lua EchoArgs.echo()<CR>')
vim.keymap.set('n', '<leader>d', ':argdelete %<CR>:lua EchoArgs.echo()<CR>')
vim.keymap.set('n', '<leader>D', ':%argdelete <CR>')
vim.keymap.set('n', '<leader><leader>', ':lua EchoArgs.echo()<CR>')
vim.keymap.set('n', '§', '<C-^>:lua EchoArgs.echo()<CR>') -- alt file
