require("flash").setup({
    labels = "asdfghlqwertyuiopzxcvbnm",
    search = { multi_window = false },
    modes = {
        char = {
            enabled = true,
            multi_line = false
        }
    },
})

vim.api.nvim_set_hl(0, "FlashMatch", { bg = "red" })

vim.keymap.set('o', 'r', function() require("flash").remote() end)
vim.keymap.set('n', ',', function () require("flash").jump({
  search = { multi_window = false },
})  end)
