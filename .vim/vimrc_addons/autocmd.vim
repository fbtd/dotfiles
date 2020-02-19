filetype on

augroup prevw
    autocmd WinEnter * if &previewwindow | setlocal cursorline | endif
augroup END


augroup filetype_ruby
    autocmd!
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby vnoremap <buffer> <LocalLeader>c :s,^,#,<Esc>
    autocmd FileType ruby vnoremap <buffer> <LocalLeader>C :s,^#,,<Esc>
augroup END

augroup filetype_eruby
    autocmd!
    autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType vim vnoremap <buffer> <LocalLeader>c :s,^,",<Esc>
    autocmd FileType vim vnoremap <buffer> <LocalLeader>C :s,^",,<Esc>
    autocmd FileType vim nnoremap <buffer> <LocalLeader>s :w<cr>:so %<cr>
augroup END

augroup bash-fc
    autocmd!
    autocmd BufRead /tmp/bash-fc-* setlocal ft=sh
    autocmd BufRead /tmp/bash-fc-* g/^/m0 | $
    autocmd BufRead /tmp/bash-fc-* setlocal relativenumber
    autocmd BufRead /tmp/bash-fc-* nnoremap <CR> o<esc>dGkdggZZ
    autocmd BufRead /tmp/bash-fc-* nnoremap q   :0,$d<CR>ZZ
augroup END

augroup man
    autocmd FileType man  silent %s/.//ge | call setpos('.',[0,1,0,0])
    autocmd FileType man  setlocal cursorline nolist colorcolumn=0 "manpages, yay
    autocmd FileType man  noremap <buffer> <LocalLeader>f /\C^\s\+--\?,\?\($\\|\s\\|=\)<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
    autocmd FileType man  noremap <buffer> <LocalLeader>s /^\c\C[A-Z ]*$<left><left><left><left><left><left><left><left><left><left>
    autocmd FileType man  noremap q :q!<Esc>
augroup END

augroup help
    autocmd FileType help setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType help setlocal cursorline nolist colorcolumn=0 "help, yay
augroup END

function! GetFoldLvl(lnum)
    let line = getline(a:lnum)
    if line =~ '^\w*\(\.\w*\)\+('
        return '>1'
    elseif line =~ '^\w' && getline(a:lnum +1) =~ '^=\+$'
        return '>1'
    endif
    return 1
endfunction

augroup pydocu
    autocmd!
    autocmd BufRead */pydocu/* setlocal foldexpr=GetFoldLvl(v:lnum)
    autocmd BufRead */pydocu/* setlocal foldmethod=expr
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab  "for makefiles, go with tabs
autocmd FileType c    setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType h    setlocal ts=8 sts=8 sw=8 noexpandtab  "for h, go with tabs
autocmd FileType text setlocal cursorline nolist colorcolumn=0
