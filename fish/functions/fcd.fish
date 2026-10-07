function fcd --description 'fzf a directory, then cd to it'
    # Directories only. ffcd is the any-path variant. find, not fd, same as bash.
    set -l dir (find $argv -type d 2>/dev/null | fzf --preview 'ls -ah {}' --tiebreak=length)
    test -n "$dir"; or return 1
    cd $dir
end
