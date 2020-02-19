"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align to char supplied as argument, multiple arguments supported
" TODO: accept regexp
" TODO: Ftm(2,",",")") => 2nd "," and then ")"
" TODO: Ftm(",",",")
"
function! Ftm(...) range
    for char in  a:000
        "find leftmost char position
        let cur_line = a:firstline
        let char_col = 0
        while cur_line <= a:lastline
            let idx = (stridx(getline(cur_line), char))
            if idx > char_col
                let char_col = idx
            endif
            let cur_line += 1
        endwhile

        let cur_line = a:firstline
        while cur_line <= a:lastline
            let line_content = getline(cur_line)
            let idx = (stridx(line_content, char))
            if idx >= 0
                let txt=substitute(line_content, char, repeat(' ', char_col-idx) . char,"")
                call setline(cur_line, txt)
            endif
            let cur_line += 1
        endwhile
    endfor
endfunction

