vim.pack.add({
    'https://github.com/ibhagwan/fzf-lua',

    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',

    'https://github.com/tpope/vim-surround',
    'https://github.com/echasnovski/mini.nvim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/folke/flash.nvim',

    'https://github.com/sainnhe/everforest',
    -- 'https://github.com/sainnhe/edge',
    -- 'https://github.com/marko-cerovac/material.nvim',
    -- 'https://github.com/savq/melange-nvim',
    'https://github.com/rose-pine/neovim',
    'https://github.com/EdenEast/nightfox.nvim',
    'https://github.com/lunacookies/vim-colors-xcode',


    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = "master" },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = "master" },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context', version = "master" },
    -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = "main" },
})

require('mini.ai').setup()
