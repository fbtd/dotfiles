if has('nvim')
    call plug#begin('~/.vim/plugged')
    if filereadable(expand("~/.vimrc_local_plugins"))
        source ~/.vimrc_local_plugins
    endif
    Plug 'fbtd/markerpath'
    Plug 'fbtd/vim-non-blank-scroll'
    "Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ibhagwan/fzf-lua'
    Plug 'tpope/vim-surround'
    Plug 'neovim/nvim-lspconfig'
    "Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
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
    set background=light
    colorscheme derpy
else
    colorscheme desert
endif

if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif

if has('nvim')
    lua require('lsp_settings')
    lua require('nvim-tree_settings')
    lua require('fzf_settings')
endif
