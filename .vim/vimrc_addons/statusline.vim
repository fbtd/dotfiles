set laststatus=2        " statusline ALWAYS visible
set statusline=%f\ %#Todo#%m%*\ [%{strlen(&fenc)?(&fenc.','):''}%{&ff}]%h%r%=c0x%B\ %c,%l/%L\ %{Hbar()}\ a%{argidx()+1}\ b%{bufnr(\"%\")}\ w%{winnr()}\ t%{tabpagenr()}\ %p%%
"set statusline=%f\ %#Todo#%m%*\ [%{strlen(&fenc)?(&fenc.','):''}%{&ff}]%h%r%=c0x%B\ %c,%l/%L\ %{Hbar()}\ w%{winnr()}\ b%{bufnr('%')}\ %p%%
let statusl_original = &statusline
nnoremap - :call <SID>Echobar(statusl_original)<cr>

function! Hbar()
    let up_pc = 100 * (line("w0") - 1) / line("$")
    let lo_pc = 100 * (line("$") - 1 - line("w$")) / line("$") 
    if lo_pc < 0
        let lo_pc = 0
    endif
    let wi_pc = 100 - up_pc - lo_pc
    let wi = up_pc . "<" . wi_pc . ">" . lo_pc
    return wi
endfunction

function! s:Echobar(original_statusline)
    if &statusline =~ '^[-#]'
        execute "setlocal statusline=" . escape(a:original_statusline, ' \')
        return
    endif

    let tot_l = line("$")
    let up_l  = line("w0") - 1
    let lo_l  = tot_l - 1 - line("w$")
    if lo_l < 0
        let lo_l = 0
    endif
    let wi_l  =  tot_l - up_l - lo_l
    let wi_wi = winwidth(0)

    let pre_c   = wi_wi * up_l / tot_l
    let after_c = wi_wi * lo_l / tot_l
    let wi_c    = wi_wi - pre_c - after_c

    let str = ''

    " TODO: use repeat()
    while pre_c > 0
        let str   .= "-"
        let pre_c -= 1
    endwhile
    while wi_c > 1
        let str   .= "#"
        let wi_c -= 1
    endwhile
    while after_c > 0
        let str   .= "-"
        let after_c -= 1
    endwhile

    execute "setlocal statusline=" . escape(str, ' \')
endfunction
