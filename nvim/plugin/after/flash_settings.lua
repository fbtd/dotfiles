local flash = require 'flash'

flash.setup({
      search = { multi_window = false },
      ["modes.char.jump_labels"] = true,
})


vim.keymap.set('n', '<Leader>j', function () require("flash").jump({
  search = { forward = true, wrap = false, multi_window = false },
})  end)

vim.keymap.set('n', '<Leader>k', function () require("flash").jump({
  search = { forward = false, wrap = false, multi_window = false },
})  end)
