set laststatus=2        " statusline ALWAYS visible
set statusline=%f\ %#Todo#%m%*\ [%{strlen(&fenc)?(&fenc.','):''}%{&ff}]%h%r%=c0x%B\ %c,%l/%L\ %{Hbar()}\ a%{argidx()+1}/%{argc()}\ b%{bufnr(\"%\")}\ w%{winnr()}\ t%{tabpagenr()}\ %p%%

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
