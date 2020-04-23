" Vim Global plugin for displaying args list
" Last change: Mon Jan 26 18:00:24 CET 2015
" ...


" Script init stuff
if exists("loaded_ll")
    finish
endif
let loaded_ll = 1

"for line continuation - i.e dont want C in &cpo
let s:old_cpo = &cpo
set cpo&vim

" plugin goes here

noremap <script> <Plug>llArgList  <SID>ArgList
noremap <SID>ArgList   :call <SID>ArgList(0)<cr>

noremap <script> <Plug>llFullList  <SID>FullList
noremap <SID>FullList   :call <SID>ArgList(1)<cr>

" print table of arguments, if 'full' == 1, list also buffers not in arg list
function s:ArgList(full)
    let a = 0
    let cur_bnr = bufnr("%")
    let alt_bnr = bufnr("#")
    let last_bnr = bufnr("$")
    let listing_args = 1    " 1: listing args, 2: listing buffers
    let arg_list = []       " list of buffer numbers in arg list
    echo("ARG\tBUF\t")
    while a < argc()
        let f = escape(fnameescape(argv(a)), '.')
        let fname = argv(a)
        let bnr = bufnr(f)
        let symbol = ""
        if bnr == cur_bnr
            echohl Visual
"           let symbol = "%"
        endif
        if bnr == alt_bnr
            echohl WarningMsg
            let symbol = "#"
        endif
        echo(a+1 . "\t" . bnr . symbol . "\t" . fname)
        echohl None
        call add(arg_list, bnr)
        let a = a + 1
    endwhile

    if a:full==0
        return
    endif

    let b = 1
    while b <= last_bnr
        let fname = bufname(b)
        if strlen(fname) == 0 || index(arg_list,b) >= 0
            let b = b + 1
            continue
        endif
        let f = escape(fnameescape(bufname(b)), '.')
        let symbol = ""
        if b == cur_bnr
            echohl Visual
"           let symbol = "%"
        endif
        if b == alt_bnr
            echohl WarningMsg
            let symbol = "#"
        endif
        echo("-\t" . b . symbol . "\t" . fname)
        echohl None
        let b = b + 1
    endwhile
endfunction

function s:LongList()
    ls
    args
endfunction

"reset &cpo back to users setting
let &cpo = s:old_cpo
