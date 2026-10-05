function ffcd --description 'fzf a path, then cd to it or its directory'
    set -l dir (_dotfiles_find $argv 2>/dev/null | fzf --preview 'ls -ah {}' --tiebreak=length)
    test -n "$dir"; or return 1
    if test -d $dir
        cd $dir
    else
        cd (path dirname $dir)
    end
end
