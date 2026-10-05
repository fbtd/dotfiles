function s3 --description 'Three-pane tmux layout with a per-directory history'
    command -q tmux; or return
    tmux list-panes &>/dev/null; or return
    if test (count (tmux list-panes)) -eq 1
        set -l slug (_hist_slug)
        # Directory this layout was opened from. cd $h to return to it.
        set -gx h $PWD
        # Session name, not a path. Fish writes ~/.local/share/fish/<name>_history
        # and switches immediately. Suffixes match the old per-pane HISTFILEs.
        set -gx fish_history {$slug}_0
        tmux split-window -t .0 -h -e fish_history={$slug}_1 -e h=$PWD
        tmux split-window -t .1 -v -e fish_history={$slug}_2 -e h=$PWD
    end
    tmux resize-pane -t .1 -x 78
    tmux resize-pane -t .2 -y 10
    tmux select-pane -t .0
end

function _hist_slug
    # /home/boris/proj -> home_boris_proj, the slug the bash HISTFILE used.
    string replace -r '^_+' '' -- (string replace -a / _ -- $PWD)
end
