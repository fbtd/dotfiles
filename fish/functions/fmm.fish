function fmm --description 'fzf a man page and open it in nvim'
    set -l page (man -k . | fzf --prompt='Man> ' | awk '{print $1}')
    test -n "$page"; or return 1
    mm $page
end
