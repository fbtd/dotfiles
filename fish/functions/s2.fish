function s2 --description 'Split the current tmux window vertically'
    command -q tmux; or return
    # tt is an abbreviation, so it would not expand here.
    set -q TMUX; or tmux -2 new-session -A -s main
    tmux split-window -t .0 -v
end
