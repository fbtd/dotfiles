local vim = vim

vim.g.mapleader = "ö"
-- vim.g.maplocalleader = "ä"

-- plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/local/share/vim-plug')

local local_plugin_path = os.getenv('HOME') .. '/nvim_plugin_local.lua'
if vim.uv.fs_stat(local_plugin_path) then
   vim.cmd.source(local_plugin_path)
end

Plug('ibhagwan/fzf-lua')
Plug('tpope/vim-surround')
Plug('neovim/nvim-lspconfig')
Plug('nvim-tree/nvim-tree.lua')

-- colorscheme
Plug('sainnhe/everforest')

-- autocompletion
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

vim.call('plug#end')

---------------
-- apparence --
---------------

vim.opt.termguicolors = true
vim.g.everforest_background = 'hard'
vim.g.everforest_dim_inactive_windows = '1'
vim.g.everforest_sign_column_background = 'grey'
vim.g.everforest_diagnostic_virtual_text = 'colored'
vim.cmd.colorscheme('everforest')

vim.opt.number = true    -- line numbers
vim.opt.showcmd = true    -- show the command you are typing
vim.opt.list = false    -- end of line and trailing spaces visibility
vim.opt.listchars = { trail = '*', tab = '>-', eol = '$' }
vim.opt.scrolloff = 2   -- keep cursor distant from top/bottom while scrolling
vim.opt.splitbelow = true    -- split in a logic way
vim.opt.splitright = true    -- split in a logic way
vim.opt.wrap = false    -- end of line and trailing spaces visibility
vim.opt.display="uhex"  -- display unprintable chars as <xx>

-- preview window
vim.keymap.set('n', '<Leader>v', ':execute "silent pedit +" . line(".") . "\\|normal\\\\ zt %"<cr>')
vim.keymap.set('n', '<Leader>c', ':pclose<cr>')

-- relative numbers
vim.keymap.set('n', '<leader><S-tab>', ':set nonu nornu signcolumn=no<cr>')
vim.keymap.set('n', '<leader><tab>', ':set nu nornu signcolumn=yes<cr>')
vim.keymap.set('n', '<S-tab>', ':set rnu! nu<cr>')
vim.keymap.set('n', '<Leader>l', ':set list!<Esc>')

--------------------------
-- moving between files --
--------------------------
vim.keymap.set('n', '<space>t', ':tabnext<CR>')
vim.keymap.set('n', '<space>T', ':tabNext<CR>')
vim.keymap.set('n', '<space>1', ':1tabnext<CR>')
vim.keymap.set('n', '<space>2', ':2tabnext<CR>')
vim.keymap.set('n', '<space>3', ':3tabnext<CR>')
vim.keymap.set('n', '<space>4', ':4tabnext<CR>')
vim.keymap.set('n', '<space>5', ':5tabnext<CR>')
vim.keymap.set('n', '<space>6', ':6tabnext<CR>')

vim.cmd.source(vim.fn.stdpath('config') .. '/echomargs.lua')
vim.keymap.set('n', '<leader>0', ':0argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>1', ':1argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>2', ':2argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>3', ':3argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>4', ':4argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>5', ':5argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>6', ':6argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>7', ':7argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>8', ':8argu<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>9', ':9argu<CR>:lua EchomArgs()<CR>')

vim.keymap.set('n', '<leader>a', ':argadd<CR>:argdedupe<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>A', ':argdelete %<CR>:lua EchomArgs()<CR>')
vim.keymap.set('n', '<tab>', ':lua EchomArgs()<CR>')
vim.keymap.set('n', '<leader>t', ':tabe \\| arglocal! %<left><left><left><left><left><left><left><left><left><left><left><left><left>')

vim.keymap.set('n', '£', '<C-]>')   --follow link with £
vim.keymap.set('n', '§', '<C-^>:lua EchomArgs()<CR>') -- alt file


--------------------
-- buffer related --
--------------------

vim.keymap.set('n', '<Leader>w', ':w<Esc>')
vim.keymap.set('i', '<Leader>w', '<esc>:w<Esc>')
vim.keymap.set('n', '<Leader>q', ':confirm q<Esc>')


------------------------
-- movement in a file --
------------------------

-- left and right scroll
vim.keymap.set('n', 'zl', '25zl')
vim.keymap.set('n', 'zh', '25zh')

-- scroll faster
vim.keymap.set('n', '<C-y>', '<C-y><C-y><C-y>')
vim.keymap.set('n', '<C-e>', '<C-e><C-e><C-e>')

------------------------
-- moving text around --
------------------------

-- indentation
vim.keymap.set('n', '<left>', '<<')
vim.keymap.set('v', '<left>', '<gv')
vim.keymap.set('n', '<right>', '>>')
vim.keymap.set('v', '<right>', '>gv')

-- move lines up and down
vim.keymap.set('n', '<up>', 'kddpk')
vim.keymap.set('n', '<down>', 'ddp')
vim.keymap.set('v', '<up>', ':<C-u>sil! \'<,\'>m\'<-2<CR>\'<V\'>')
vim.keymap.set('v', '<down>', 'dp\'[V\']')


-----------------
-- Insert mode --
-----------------

-- no arrow movement
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')

-- exit form insert mode with move
vim.keymap.set('i', 'jj', '<Esc>j')
vim.keymap.set('i', 'kk', '<Esc>k')
vim.keymap.set('i', 'JJ', '<Esc>o')
vim.keymap.set('i', 'KK', '<Esc>O')
vim.keymap.set('i', 'jk', '<Esc>')

-- readline(3) movement in insert mode
vim.keymap.set('i', '<C-a>', '<C-o>0')
vim.keymap.set('i', '<C-e>', '<C-o>$')
vim.keymap.set('i', '<C-f>', '<C-o>l')
vim.keymap.set('i', '<C-b>', '<C-o>h')

vim.keymap.set('n', '<Leader>O', 'O<Esc>j')
vim.keymap.set('n', '<Leader>o', 'o<Esc>k')


------------
-- search --
------------

vim.opt.ignorecase = true    -- search is not case sensitive
vim.opt.smartcase = true    -- search is case sensitive if upper UPPER letter in pattern
vim.opt.incsearch = false    -- no jumpiung around!

vim.opt.hlsearch = false    -- highlight searchs
vim.keymap.set('n', '<Leader>h', ':set hlsearch!<Esc>')


-----------------
-- other stuff --
-----------------

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true    -- use spaces, not tabs
vim.opt.autoindent = true    -- automatic indentation

-- Others
vim.opt.hidden = true    -- allow hidden buffers
vim.opt.mouse = {}  -- disable mouse
vim.opt.exrc = true    -- enable local .exrc file
vim.opt.swapfile = false    -- no .%.swp
vim.opt.virtualedit = 'block' -- enable virtualedit for visual block mode
vim.opt.formatoptions = {'t', 'l'}
vim.opt.wrapscan = false    -- no file wrap during search
vim.opt.modeline = true    -- allow modeline ( /* vim: set sw=2: */ )
vim.opt.timeout = false
vim.opt.sessionoptions:append('globals')
vim.opt.wildignore:append({'.git/*','venv/*'})

-- fix Y behaviour
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'q:', ':q<CR>')

-- paste mode
vim.keymap.set('n', '<Leader>p', ':set paste!<Esc>')

-- execute cmd from ext file
vim.keymap.set('n', '<leader>SS', ':source ~/tmp/vim_to_this.vim<CR>')

-- leader leader to escape
vim.keymap.set('c', '<Leader><Leader> ', '<Esc><Esc>')
vim.keymap.set('i', '<Leader><Leader> ', '<Esc><Esc>')
vim.keymap.set('n', '<Leader><Leader> ', '<Esc><Esc>')
vim.keymap.set('v', '<Leader><Leader> ', '<Esc><Esc>')

-- statusline
vim.cmd.source(vim.fn.stdpath('config') .. '/statusline.vim')

-- TODO: to autocmple file
-- autocomplete
vim.opt.wildmode = {'longest','list'} -- command mode
vim.opt.completeopt = {'menuone','menu','noselect','popup'} -- insert mode

-- autocomplete, choose next and prev like fzf
vim.keymap.set('i', '<C-j>', '<C-n>')
vim.keymap.set('i', '<C-k>', '<C-p>')

-- sessions and shada
-- vim.keymap.set('n', '<Leader>s', ':mksession!<CR>:wshada '.. vim.fn.getcwd() ..'/.shada<CR>')
vim.keymap.set('n', '<Leader>s', ':mksession!<CR>:wshada<CR>')
vim.opt.shada = {'!', '\'200', '<1000', 's100' }


-- load local nvim configuration
local local_init_path = os.getenv('HOME') .. '/nvim_init_local.lua'
if vim.uv.fs_stat(local_init_path) then
   vim.cmd.source(local_init_path)
end

