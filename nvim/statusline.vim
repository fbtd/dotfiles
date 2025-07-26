set laststatus=2        " statusline ALWAYS visible
set statusline=%f\ %#Todo#%m%*\ [%{strlen(&fenc)?(&fenc.','):''}%{&ff}]\ %{MarksHere()}\ %h%r%=c0x%B\ %c,%l/%L\ %{Hbar()}\ a%{argidx()+1}/%{argc()}\ b%{bufnr(\"%\")}\ %p%%

" horizontal bar
" above < visible > below (%)
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

function! MarksHere()
    let l:matches = ""
    let l:marks_to_check ="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let l:cur_bufnr = bufnr("%")
    for mark in split(marks_to_check, '\zs')
        let l:pos = getpos("'" . mark)
        if l:pos[0] == l:cur_bufnr
            let l:matches .= mark
        endif
    endfor
    return l:matches
endfunction
