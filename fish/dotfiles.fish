set --global fish_greeting

# colors
set --global fish_color_autosuggestion 9ca0b0
set --global fish_color_cancel d20f39
set --global fish_color_command 1e66f5
set --global fish_color_comment 8c8fa1
set --global fish_color_cwd df8e1d
set --global fish_color_cwd_root 
set --global fish_color_end 875f00
set --global fish_color_error d20f39
set --global fish_color_escape e64553
set --global fish_color_gray 9ca0b0
set --global fish_color_history_current 
set --global fish_color_host 1e66f5
set --global fish_color_host_remote 40a02b
set --global fish_color_keyword 8839ef
set --global fish_color_normal 4c4f69
set --global fish_color_operator ea76cb
set --global fish_color_option 40a02b
set --global fish_color_param ff5f00
set --global fish_color_quote 40a02b
set --global fish_color_redirection ff00ff
set --global fish_color_search_match --background=ccd0da
set --global fish_color_selection --background=ccd0da
set --global fish_color_status d20f39
set --global fish_color_user 179299
set --global fish_color_valid_path 
set --global fish_pager_color_completion 4c4f69
set --global fish_pager_color_description 9ca0b0
set --global fish_pager_color_prefix ea76cb
set --global fish_pager_color_progress 9ca0b0
set --global fish_pager_color_selected_background 
set --global fish_pager_color_selected_completion 
set --global fish_pager_color_selected_description 
set --global fish_pager_color_selected_prefix 

# Prepend cargo, append scripts, same order as bash. --path writes PATH itself
# so scripts stay after the system directories instead of jumping ahead of them.
fish_add_path --path --move $HOME/.cargo/bin
fish_add_path --path --append --move $HOME/scripts

# v is an abbreviation, so a program that execs EDITOR must get the real binary.
set -gx EDITOR nvim
set -gx SUDO_EDITOR vi
set -gx CHTSH_QUERY_OPTIONS style=xcode
set -gx LESS RM
set -gx NVIM_FILE_LIST $HOME/tmp/nvim_ipc/file_list.txt
set -gx T_RUN ./.run.sh
set -gx T_MAKE 'git status --short'
set -gx PYTHONSTARTUP $HOME/.pythonrc

# dircolors emits csh (`setenv LS_COLORS '...'`). Rewrite that one word.
if command -q dircolors
    if test -r ~/.dircolors
        eval (dircolors -c ~/.dircolors | string replace 'setenv ' 'set -gx ')
    else
        eval (dircolors -c | string replace 'setenv ' 'set -gx ')
    end
end

# Abbreviations do not expand inside each other, so the color flag is repeated.
abbr -a ls 'ls --color=auto'
abbr -a grep 'grep --color=auto'
abbr -a ip 'ip --color=auto'

abbr -a ee exit
abbr -a ll 'ls --color=auto -lah'
abbr -a la 'ls --color=auto -A'
abbr -a l 'ls --color=auto -CF'
abbr -a -- .. 'cd ..'
abbr -a -- 2. 'cd ../..'
abbr -a -- 3. 'cd ../../..'
abbr -a -- 4. 'cd ../../../..'

abbr -a dfc 'df -h | cowsay -bn'
abbr -a tt 'tmux -2 new-session -A -s main'
abbr -a tm 'tmux -2 new-session -A -s'

abbr -a z 'eza --icons -A'
abbr -a zz 'eza --long --icons -A'
abbr -a zn 'eza --long --icons -A --numeric'
abbr -a zs 'eza --long --icons -A --sort=size'
abbr -a zS 'eza --long --icons -A --sort=size --reverse'
abbr -a zd 'eza --long --icons -A --sort=date'
abbr -a zD 'eza --long --icons -A --sort=date --reverse'
abbr -a zr 'eza --icons --recurse -A'
abbr -a t 'eza --tree --icons -A --git-ignore'
abbr -a t2 'eza --tree --icons -L2 -A --git-ignore'
abbr -a t3 'eza --tree --icons -L3 -A --git-ignore'
abbr -a t4 'eza --tree --icons -L4 -A --git-ignore'
abbr -a t5 'eza --tree --icons -L5 -A --git-ignore'
abbr -a th 'eza --tree --icons -A'
abbr -a th2 'eza --tree --icons -L2 -A'
abbr -a th3 'eza --tree --icons -L3 -A'
abbr -a th4 'eza --tree --icons -L4 -A'
abbr -a th5 'eza --tree --icons -L5 -A'

abbr -a gcm 'git commit -m'
# Abbreviations do not expand inside each other, so glg/gla repeat gl.
set -l _gl "git log --pretty='%C(yellow)%h %C(cyan)%ad %Creset%s%C(auto)%d' --date=relative"
abbr -a gl "$_gl"
abbr -a glg "$_gl --graph"
abbr -a gla "$_gl --graph --all"
abbr -a gb 'git branch --list --all -vv'
abbr -a gec git_extract_conflicts.sh
abbr -a gdd 'git diff | delta'
abbr -a gdid 'git diff --staged | delta'
abbr -a gai 'git add --interactive'
abbr -a gau 'git add --update'
abbr -a gr 'git rebase --interactive HEAD~20'

abbr -a p python3
abbr -a v nvim
abbr -a rgh 'rg --hidden --no-ignore'
abbr -a fdh 'fd --hidden --no-ignore'

abbr -a drrm 'docker run --rm'
abbr -a dps 'docker ps'
abbr -a dpsa 'docker ps -a'
abbr -a dcp 'docker container prune'
abbr -a k kubectl

abbr -a s8 'tmux resize-pane -t .1 -x 78'
# Kept verbatim for now. An ssh config Host would be the better home.
abbr -a sshhurk 'TERM=tmux-256color ssh -Y hermes@vmi2751986.contaboserver.net'

# Ctrl-R history, Ctrl-T files, Alt-C cd.
command -q fzf; and fzf --fish | source

# fd if present, else find. Shared by the fzf pickers.
function _dotfiles_find
    if command -q fd
        fd . $argv
    else
        find $argv
    end
end

# Pick a path, store it in the named global, and print it. Used by f1/f2/f3.
function _fzf_stash --argument-names dest
    set -l picked (_dotfiles_find $argv[2..-1] 2>/dev/null | fzf --preview 'cat {}' --tiebreak=length)
    test -n "$picked"; or return 1
    set -g $dest $picked
    echo $picked
end
