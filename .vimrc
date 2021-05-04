if has('nvim')
    call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fbtd/markerpath'
    Plug 'ctrlpvim/ctrlp.vim'
    call plug#end()
else
    set nocompatible              " be iMproved, required
endif

syntax enable
source ~/.vim/vimrc_addons/set_options.vim
source ~/.vim/vimrc_addons/fmt.vim " TODO: implement as plugin
source ~/.vim/vimrc_addons/mappings.vim
source ~/.vim/vimrc_addons/autocmd.vim
source ~/.vim/vimrc_addons/camelCase.vim

" TODO: implement as plugin
" statusline
"set laststatus=2        " statusline ALWAYS visible
"set statusline=%f\ %#Todo#%m%*\ [%{strlen(&fenc)?(&fenc.','):''}%{&ff}]%h%r%=c0x%B\ %c,%l/%L\ %{Hbar()}\ w%{winnr()}\ b%{bufnr('%')}\ %p%%
source ~/.vim/vimrc_addons/statusline.vim

if $TERM == "xterm" || $TERM == "screen-256color" || $TERM == "xterm-256color"
    set t_Co=256
    colorscheme bubblegum
else
    colorscheme desert
endif
