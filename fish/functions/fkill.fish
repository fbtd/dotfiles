function fkill --description 'fzf a process and kill it'
    # Optional argument is the signal. Default 9, same as the bash version.
    set -l signal 9
    set -q argv[1]; and set signal $argv[1]
    set -l lines
    if test (id -u) -ne 0
        set lines (ps -f -u (id -u) | tail -n +2 | fzf -m)
    else
        set lines (ps -ef | tail -n +2 | fzf -m)
    end
    test -n "$lines[1]"; or return 1
    kill -$signal (printf '%s\n' $lines | awk '{print $2}')
end
