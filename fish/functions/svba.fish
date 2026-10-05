function svba --description 'Activate ./venv or ./.venv' --argument-names name
    # Fish cannot source bash activate. Python venv ships activate.fish beside it.
    set -l dirs $name
    set -q name[1]; or set dirs venv .venv
    for d in $dirs
        set -l script ./$d/bin/activate.fish
        if test -f $script
            source $script
            return
        end
    end
    echo 'venv folder not found' >&2
    return 1
end
