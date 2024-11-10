local flash = require 'flash'

flash.setup({
    labels = "asdfghlqwertyuiopzxcvbnm",
    search = { multi_window = false },
    modes = {char = { enabled = false}},
})


vim.keymap.set('n', '<Leader>j', function () require("flash").jump({
  search = { forward = true, wrap = false, multi_window = false },
})  end)

vim.keymap.set('n', '<Leader>k', function () require("flash").jump({
  search = { forward = false, wrap = false, multi_window = false },
})  end)

vim.keymap.set('o', 'r', function() require("flash").remote() end)
vim.api.nvim_set_hl(0, "FlashMatch", {bg= "red"})
