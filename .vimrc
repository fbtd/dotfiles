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

"" Grafical - affecting vim "
"""""""""""""""""""""""""""""
" if terminal allow funny coloring, use them all!
if $TERM == "xterm" || $TERM == "screen-256color" || $TERM == "xterm-256color"
    set t_Co=256
    colorscheme bubblegum
else
    colorscheme desert
endif


"" filtype dependent commands "
"""""""""""""""""""""""""""""""
"see more on http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/

"" plugins "
""""""""""""

" tslime.vim communication between vim and tmux
"source ~/.vim/tslime.vim
"nnoremap <C-c> :Tmux ls<CR>


" pathogen
execute pathogen#infect()

"filetype off
"call pathogen#infect()
"call pathogen#helptags()
filetype plugin indent on
syntax on

"" Plugins settings "
"""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#usages_command = "<leader>f"
