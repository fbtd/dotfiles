function lf --description 'lf, unless this shell was spawned by lf'
    # lf exports lf_info into the shell it opens. Exit rather than nest.
    set -q lf_info; and exit
    command lf $argv
end
