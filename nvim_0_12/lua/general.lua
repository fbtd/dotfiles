vim.opt.termguicolors = true
vim.opt.number = true     -- line numbers
vim.opt.showcmd = true    -- show the command you are typing
vim.opt.list = false      -- end of line and trailing spaces visibility
vim.opt.listchars = { trail = '*', tab = '>-', eol = '$' }
vim.opt.scrolloff = 2     -- keep cursor distant from top/bottom while scrolling
vim.opt.splitbelow = true -- split in a logic way
vim.opt.splitright = true -- split in a logic way
vim.opt.wrap = false      -- end of line and trailing spaces visibility
vim.opt.display = "uhex"  -- display unprintable chars as <xx>
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.conceallevel = 1
vim.opt.hidden = true         -- allow hidden buffers
vim.opt.mouse = {}            -- disable mouse
vim.opt.exrc = true           -- enable local .exrc file
vim.opt.swapfile = false      -- no .%.swp
vim.opt.virtualedit = 'block' -- enable virtualedit for visual block mode
vim.opt.wrapscan = false      -- no file wrap during search
vim.opt.modeline = true       -- allow modeline ( /* vim: set sw=2: */ )
vim.opt.timeout = false
vim.opt.wildignore:append({ '.git/*', 'venv/*' })

vim.keymap.set('n', '<Leader>r', ':set wrap!<CR>')
vim.keymap.set('n', '<leader>.', function() vim.cmd('edit ' .. vim.fn.expand('%:p:h')) end)
vim.keymap.set('n', '£', '<C-]>') --follow link with £
vim.keymap.set('n', '<Leader>p', ':set paste!<Esc>')
vim.keymap.set('n', '<Leader>y', ":let @+ = expand('%') . ':' . line('.')<CR>")
vim.keymap.set('n', '<Leader>w', ':w<Esc>')
vim.keymap.set('i', '<Leader>w', '<esc>:w<Esc>')
vim.keymap.set('n', 'zl', '25zl')
vim.keymap.set('n', 'zh', '25zh')
vim.keymap.set('n', '<C-y>', '<C-y><C-y><C-y>')
vim.keymap.set('n', '<C-e>', '<C-e><C-e><C-e>')
vim.keymap.set('n', '<leader>-', '/\\C^ *-\\(\\w, --\\)\\?-\\?')
vim.keymap.set('n', '<C-S-o>', '[{')
vim.keymap.set('n', '<leader><C-o>', '<C-i>') -- jump forward
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', '<C-h>', ':sp<CR>')

-- [ & ] moves
vim.keymap.set('n', '[t', ':tabp<CR>')
vim.keymap.set('n', ']t', ':tabn<CR>')
vim.keymap.set('n', '[T', ':tabfirst<CR>')
vim.keymap.set('n', ']T', ':tablast<CR>')

-- relative numbers
vim.keymap.set('n', '<leader><S-tab>', ':set nonu nornu signcolumn=no<cr>')
vim.keymap.set('n', '<leader><tab>', ':set nu nornu signcolumn=yes<cr>')
vim.keymap.set('n', '<S-tab>', ':set rnu! nu<cr>')

vim.keymap.set('n', '<Leader>l', ':set list!<Esc>')

-- indentation
vim.keymap.set('n', '<left>', '<<')
vim.keymap.set('v', '<left>', '<gv')
vim.keymap.set('n', '<right>', '>>')
vim.keymap.set('v', '<right>', '>gv')

-- move lines up and down
vim.keymap.set('v', '<up>', ':<C-u>sil! \'<,\'>m\'<-2<CR>\'<V\'>')
vim.keymap.set('v', '<down>', 'dp\'[V\']')

-- copy paste visual mode should not update the " register
vim.keymap.set('v', 'p', '"_dP')
-- same for 'c' and 's'
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 's', '"_s')

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

-- put empty line above/below
vim.keymap.set('n', '<Leader>O', 'O<Esc>j')
vim.keymap.set('n', '<Leader>o', 'o<Esc>k')

-- search
vim.opt.ignorecase = true -- search is not case sensitive
vim.opt.smartcase = true  -- search is case sensitive if upper UPPER letter in pattern
vim.opt.incsearch = false -- no jumpiung around!
vim.opt.hlsearch = false  -- highlight searchs
vim.keymap.set('n', '<Leader>h', ':set hlsearch!<Esc>')

-- default tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true  -- use spaces, not tabs
vim.opt.autoindent = true -- automatic indentation

