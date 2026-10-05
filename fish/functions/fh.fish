function fh --description 'fzf every fish history session onto the command line'
    # History files are not plain command lists; each entry is a `- cmd:` line.
    # This searches every session, not just the current one.
    set -l hist_dir ~/.local/share/fish
    set -q XDG_DATA_HOME; and test -n "$XDG_DATA_HOME"; and set hist_dir $XDG_DATA_HOME/fish
    set -l files (path filter $hist_dir/*_history)
    test (count $files) -gt 0; or return 1
    set -l picked (
        rg --no-filename -N '^- cmd: ' $files \
        | string replace -r '^- cmd: ' '' \
        | sort -u \
        | fzf
    )
    test -n "$picked"; or return 1
    commandline -r -- $picked
end
