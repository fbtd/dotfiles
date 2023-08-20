let mapleader = "ö"
let maplocalleader = "ä"

"" using space to move between buffers "
""""""""""""""""""""""""""""""""""""""""

nnoremap <space><space>B :bfirst<CR>
nnoremap <space><space>b :blast<CR>
nnoremap <space>b :bnext<CR>
nnoremap <space>B :bNext<CR>
nnoremap <space><space>A :first<CR>:args<CR>
nnoremap <space><space>a :last<CR>:args<CR>
nnoremap <space>a :next<CR>:args<CR>
nnoremap <space>A :Next<CR>:args<CR>
nnoremap <space><space>T :tabfirst<CR>:args<CR>
nnoremap <space><space>t :tablast<CR>:args<CR>
nnoremap <space>t :tabnext<CR>
nnoremap <space>T :tabNext<CR>
nnoremap <space>1 :1tabnext<CR>
nnoremap <space>2 :2tabnext<CR>
nnoremap <space>3 :3tabnext<CR>
nnoremap <space>4 :4tabnext<CR>
nnoremap <space>5 :5tabnext<CR>
nnoremap <space>6 :6tabnext<CR>

nnoremap <leader>0 :0argu<CR>
nnoremap <leader>1 :1argu<CR>
nnoremap <leader>2 :2argu<CR>
nnoremap <leader>3 :3argu<CR>
nnoremap <leader>4 :4argu<CR>
nnoremap <leader>5 :5argu<CR>
nnoremap <leader>6 :6argu<CR>

"" More navigation "
""""""""""""""""""""

nnoremap <space>l 25l
nnoremap <space>h 25h

"allow link follow with enter
nnoremap £ <C-]>

"" Moving text around "
"""""""""""""""""""""""

" indent lines
nnoremap <left> <<
vnoremap <left> <gv
nnoremap <right> >>
vnoremap <right> >gv

" move lines up and down
nnoremap <up> kddpk
nnoremap <down> ddp
" TODO: google a better way
vnoremap <up> :<C-u>sil! '<,'>m'<-2<CR>'<V'>
vnoremap <down> dp'[V']

noremap <Leader>O O<Esc>j
noremap <Leader>o o<Esc>k

"" Insert mode cool stuff "
"""""""""""""""""""""""""""

" no arrow movement
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" exit form insert mode with move
inoremap jj <Esc>j
inoremap kk <Esc>k
inoremap JJ <Esc>o
inoremap KK <Esc>O
inoremap jk <Esc>

" readline(3) movement in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

" left and right scroll
nnoremap zl 25zl
nnoremap zh 25zh

" a couple bindings for better CamelCase and under_score_case navigation
source ~/.vim/vimrc_addons/camelCase.vim

"" Buffers related "
""""""""""""""""""""

" jump to buffers CTRL_^ replacement
"noremap <leader>b <C-^>
noremap § <C-^>

noremap <Leader>w :w<Esc>
inoremap <Leader>w <esc>:w<Esc>
noremap <Leader>q :confirm q<Esc>
noremap <Leader>Q :confirm qa<Esc>
noremap <Leader>W :%s/\s\+$//e<CR>:w<CR>

"" Shortcuts "
""""""""""""""

nnoremap <leader>e :exec getline(".")<cr>
noremap <S-tab> :set rnu! nu<cr>
noremap <leader><S-tab> :set nonu nornu<cr>

cnoremap <Leader><Leader>  <Esc><Esc>
inoremap <Leader><Leader>  <Esc><Esc>
noremap  <Leader><Leader>  <Esc><Esc>
vnoremap <Leader><Leader>  <Esc><Esc>

noremap <Leader>h :set hlsearch!<Esc>
noremap <Leader>l :set list!<Esc>
"noremap <Leader>s :set spell!<Esc>

noremap <Leader>r :registers<Esc>
inoremap <Leader>r <C-o>:registers<Esc>
noremap <Leader>m :marks<Esc>
noremap <Leader>M :marks QWERTZUIOPASDFGHJKLYXCVBNM<Esc>
noremap <Leader>j :jumps<Esc>

nnoremap <C-y> <C-y><C-y><C-y>
nnoremap <C-e> <C-e><C-e><C-e>

"" Preview window "
"""""""""""""""""""

nnoremap <Leader>v :execute "silent pedit +" . line(".") . "\|normal\\ zt %"<cr>
nnoremap <Leader>c :pclose<cr>
nnoremap <Leader>y :set completeopt+=preview<cr>
nnoremap <Leader>x :set completeopt-=preview<cr>

" TODO: call function to display cool arglist
"nnoremap <Leader>a :args<cr>
"nnoremap <Leader>y :set previewheight=1<CR>
"nnoremap <Leader>x :set previewheight=10<CR>

nnoremap <Leader>ç :vertical resize 80<CR>
" make Y behave like other capitals
noremap Y y$

"" tags "
"""""""""
noremap <Leader>t :tags<Esc>
nnoremap £ <C-]>
inoremap £ <C-X><C-]>

"" copy/paste and clipboard "
noremap <Leader>p :set paste!<Esc>

"" TODO Tmux integration
if !has('nvim')
    function Func2X11()
        :call system('xclip -selection clipboard', @r)
    endfunction
    vnoremap <leader><C-a> "ry:call Func2X11()<cr>
    nnoremap <leader><C-v> :set paste<cr>:r !xclip -o -selection clipboard<cr>:set nopaste<cr>
else
    vnoremap <leader><C-a> "+y
    nnoremap <leader><C-v> "+p
endif

"" plugin related "
"""""""""""""""""""

"noremap <Leader>n :NERDTreeToggle<Esc>

"imap <C-J> <Plug>snipMateNextOrTrigger
"smap <C-J> <Plug>snipMateNextOrTrigger
"imap <C-H> <Plug>snipMateBack
"smap <C-H> <Plug>snipMateBack
"imap <C-G> <Plug>snipMateShow
"smap <C-G> <Plug>snipMateShow

"Coc triggers
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent> <leader>s <C-o>:call CocActionAsync('showSignatureHelp')<cr>
nnoremap <silent> <leader>s :call CocActionAsync('showSignatureHelp')<cr>
nnoremap <silent> <leader>d :call CocActionAsync('jumpDefinition')<cr>
nnoremap <silent> <c-space> :call CocActionAsync('highlight')<cr>
nnoremap <silent> <leader>i :call CocActionAsync('doHover')<cr>

"scroll float
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

"map <Leader>a <Plug>llArgList:silent! argument<space>0
"map <Leader>b <Plug>llFullList:silent! buffer<space>0
nnoremap  <leader><tab> :args<cr>
" MarkerPath
" MP_MarkersToGlobals()     to save Markers ino global vars
" MP_EchomAll()             to show a list of open files w/ markers
nnoremap <leader>S :call MP_MarkersToGlobals()<cr>:mksession!<cr>
nnoremap <leader><space> :call MP_EchomAll()<cr>

nnoremap <C-n> :CtrlPMRU<cr>
nnoremap <C-b> :CtrlPBuffer<cr>
