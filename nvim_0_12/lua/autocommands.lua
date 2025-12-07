vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})


local ft_man = vim.api.nvim_create_augroup('ft_map', { clear = false })
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'man',
    group = ft_man,
    callback = function()
        vim.keymap.set('n', 'q', ':q<CR>', {buffer = 0, noremap=false})
    end
})

local ft = vim.api.nvim_create_augroup('init', { clear = false })
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = '*',
    group = ft,
    callback = function()
        -- remove autocomments, event if the ft plugins want them
        vim.opt.formatoptions:remove('c')
        vim.opt.formatoptions:remove('r')
        vim.opt.formatoptions:remove('o')
    end
})
