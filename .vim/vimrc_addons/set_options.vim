"" Graphical - no impact "  
"""""""""""""""""""""""""
set number              " line numbers
set ruler               " current posizion in corner
set showcmd             " show the command you are typing
set colorcolumn=81      " highlight 80th col
set nolist              " end of line and trailing spaces visibility
set listchars=trail:*,tab:>-,eol:$
set scrolloff=2         " keep cursor distant from top/pottom while scrolling
set splitbelow          " split in a logic way
set splitright          " split in a logic way
set foldmethod=indent
set nofoldenable
set nowrap

"" Search "
"""""""""""
set ignorecase          " search is not case sensitive
set smartcase           " search is case sensitive if upper UPPER letter in pattern
set nohlsearch          " highlight searchs

"" Tabs "
"""""""""
set tabstop=4           " 4 spaces for a tab
set shiftwidth=4
set softtabstop=4
set expandtab           " use spaces, not tabs
set autoindent          " automatic indentation

"" Other "
""""""""""
set hidden                  " allow hidden buffers
set mouse=""                " disable mouse
set exrc                    " enable local .exrc file
set noswapfile              " no .%.swp
set wildmenu                " autocomplete suggestion menu
set wildmode=longest,list   " autocomplete term style
"set nrformats+=alpha        " CTRL+A and CTRL+X works also for letters
set virtualedit=block       " enable virtualedit for visual block mode
"set iskeyword-=_            " treat _ like whitespace and tabs
setlocal spelllang=en_us         " set lang for spellcheck
set formatoptions-=o        " no autocomment new lines
set formatoptions-=r        " no autocomment new lines
set nowrapscan              " no file wrap during search
set grepprg=grep\ -rn\ '$*'\ .\ /dev/null "use gre as recursive search from .
set modeline                " allow modeline ( /* vim: set sw=2: */ )
set notimeout
