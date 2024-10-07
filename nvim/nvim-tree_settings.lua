vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
        side = "right",
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
                modified = false,
                hidden = false,
                diagnostics = false,
                bookmarks = false,
            },
        },
    },
})

vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>')
