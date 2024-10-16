vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.termguicolors = true
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function ctrl_e()
        local key = vim.api.nvim_replace_termcodes("<C-e>", true, false, true)
        vim.api.nvim_feedkeys(key, "n", true)
    end

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "r", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "<C-e>", ctrl_e, opts("Up"))
end

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
    on_attach = my_on_attach,
})

vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>')
vim.keymap.set('n', '<leader>N', '<cmd>NvimTreeClose<cr>')
