# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# avoid duplicated
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u \[$(tput setaf 5)\]\w \[$(tput setaf 4)\][\j] \t\n\[$(tput setaf 1)\]\! \$ \[$(tput sgr0)\]"
    PS1="\[$(tput bold)$(tput setaf 4)\]\w\[$(tput setaf 1)\$(test \$? != 0 && tput smso)\] \\$ \[$(tput sgr0)\]"
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u\[\033[00m\] \[\033[01;34m\]\w \[\033[00;37m\]\$\[\033[00m\] '
    PS4='\[\033[00;32m\[==> \[\033[00m\['
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    PS1="\e[31m$PS1\e[0m"
    ;;
*)
    ;;
esac

# some more ls aliases
alias ee='exit'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias dfc='df -h | cowsay -bn'
alias tt='tmux -2 new-session -A -s wrk'
alias ttt='tmuxinator start wrk'

alias z='eza --icons -A'
alias zz='eza --long --icons -A'
alias zn='eza --long --icons -A --numeric'
alias zd='eza --long --icons -A --sort=date'
alias zD='eza --long --icons -A --sort=date --reverse'
alias zr='eza --icons --recurse -A'
alias t='eza --tree --icons -A --git-ignore'
alias t2='eza --tree --icons -L2 -A --git-ignore'
alias t3='eza --tree --icons -L3 -A --git-ignore'
alias t4='eza --tree --icons -L4 -A --git-ignore'
alias t5='eza --tree --icons -L5 -A --git-ignore'

# lol who still uses those?
alias pd='pushd'
alias pd2='pushd +2'
alias pd3='pushd +3'
alias pd4='pushd +4'
alias pd5='pushd +5'
alias dv='dirs -v'

alias gl="git log --pretty='%C(yellow)%h %C(cyan)%ad %Creset%s%C(auto)%d' --date=relative"
alias glg="gl --graph"
alias gla='glg --all'
alias gb='git branch --list --all -vv'
alias gec='git_extract_conflicts.sh'

alias p="python3"
alias bp="python3 -m bpython"

alias glow="glow -p -l --style light"

function jqless () {
    jq '.' -C "$1" | less -r
}

# functions: TODO put in different file

function gs () {
    git status
    echo "--- HEAD ----"
    git diff --stat
    echo ""
    echo "--- INDEX ---"
    git diff --stat --staged
}

function we() {
    explorer.exe "${1:-.}"
}

function mkcd () { mkdir -p "$1" && cd "$1" ; }
function ,, () {
echo ""
echo ' _____ _   _ _______ ______ _____  __  __ _____  _____ _____ _____ ____  _   _ '
echo '|_   _| \ | |__   __|  ____|  __ \|  \/  |_   _|/ ____/ ____|_   _/ __ \| \ | |'
echo '  | | |  \| |  | |  | |__  | |__) | \  / | | | | (___| (___   | || |  | |  \| |'
echo '  | | | . ` |  | |  |  __| |  _  /| |\/| | | |  \___ \\___ \  | || |  | | . ` |'
echo ' _| |_| |\  |  | |  | |____| | \ \| |  | |_| |_ ____) |___) |_| || |__| | |\  |'
echo '|_____|_| \_|  |_|  |______|_|  \_\_|  |_|_____|_____/_____/|_____\____/|_| \_|'
echo "";
}
function , () {
    for _ in $(seq 1 $(tput cols)) ; do
        echo -n "#"
    done
    echo ""
}

function f () {
    find . -not -path '*/.git/*' -not -path '*/venv/*' -not -path '*/.venv/*'
}

function s2 () {
    [ -z ${TMUX+x} ] && tt  # if tmux is not running, start it
    tmux split-window -t .0 -v
}

HIST_FOLDER="$HOME/.var/bash_history"
function s3 () {
    which tmux >/dev/null || return
    [ -z ${TMUX+x} ] && tt  # if tmux is not running, start it
    n_panes=$(tmux list-panes | wc -l)
    if [ "$n_panes" -eq 1 ]; then
        mkdir -p "$HIST_FOLDER"
        p="$(pwd | sed 's%/%_%g; s/_//1')"
        histfile=${HIST_FOLDER}/${p}

        HISTFILE=${histfile}_0
        history -c
        history -r
        tmux split-window -t .0 -h -e HISTFILE=${histfile}_1
        tmux split-window -t .1 -v -e HISTFILE=${histfile}_2
    fi
    tmux resize-pane  -t .1 -x 87
    tmux resize-pane  -t .2 -y 10
    tmux select-pane  -t .0
}

function svba () {
    if [ -n "$1" ]; then
        source ./$1/bin/activate
        return $?
    else
        for venv_folder in "venv" ".venv"; do
            if [ -d "$venv_folder" ]; then
                source ./$venv_folder/bin/activate
                return $?
            fi
        done
    fi
    echo venv folder not found
    return 1
}

# docker stuff, thx https://gist.github.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb
function dex {
	docker exec -it $1 ${2:-bash}
}

function dnames {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip {
    echo "IP addresses of all named running containers"

    for DOC in `dnames`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

alias drrm="docker run --rm"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dcp="docker container prune"

# chsht.sh
export CHTSH_QUERY_OPTIONS="style=xcode"

export CLICOLOR=1
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ip='ip --color=auto'
fi

export LESS=RM


# ugly context grep
function cgrep {
    echo "$(tput setaf 5)$(file $2)$(tput setaf 0)"
    echo "$(tput setaf 6)> head -n 5$(tput setaf 0)"
    head -n 5 $2
    echo ""
    echo "$(tput setaf 6)> grep -C 3$(tput setaf 0)"
    grep -n -C 3 "$1" --color=always $2
    echo ""
    echo ">$(tput setaf 6) tail -n 5$(tput setaf 0)"
    tail -n 5 $2
    echo ""
    echo "$(tput setaf 6)line count: $(tput setaf 5) $(wc -l $2)$(tput setaf 0)"
}

# lf and shell

# PS1="\[$(tput bold)$(tput setaf 4)\]\w\[$(tput setaf 1)\$(test \$? != 0 && tput smso)\] \\$ \[$(tput sgr0)\]"
PS1="$(test -v lf_info && echo '<LF> ' )$PS1"
function lf {
    [ -v lf_info ] && exit
    command lf $@
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /usr/share/bash-completion/completions/man ]; then
    . /usr/share/bash-completion/completions/man
    complete -o default -o nospace -F _man mm
fi

if [ -f ~/.bash_local ] ; then
    . ~/.bash_local
fi


## VIM STUFF ##
export NVIM_FILE_LIST="$HOME/tmp/nvim_ipc/file_list.txt"

export SUDO_EDITOR=vim
if which nvim &>/dev/null ; then 
    # NVIM
    alias v=nvim
    export EDITOR=nvim

    function mm () {
        if man --where $* &> /dev/null ; then
            nvim -c "Man $*" -c 'only'
        else
           echo 'man page not found'
        fi
    }
else
    # VIM
    alias v=vim
    export EDITOR=vim

    function mm () {
        if man --where $* &> /dev/null ; then
           vim -c 'source $VIMRUNTIME/ftplugin/man.vim' -c "Man $*" -c 'only'
        else
           echo 'man page not found'
        fi
    }
fi

# edit file:linenumber passed in as $1
function vl {
    v +${1#*:} ${1%%:*}
}

# display
export DISPLAY=:0

export T_RUN='./.run.sh'
export T_MAKE='git status --short'

export PYTHONSTARTUP=~/.pythonrc

find_cmd='find'
# fzf https://github.com/junegunn/fzf
if which fd &>/dev/null ; then 
    export FZF_DEFAULT_COMMAND='fd --type file'
    find_cmd='fd . '
fi

if which fzf &>/dev/null ; then
    function fcd () {
        dir=$(find $1 -type d 2>/dev/null | fzf --preview 'ls -ah {}' --tiebreak=length)
        [ -z "$dir" ] && return 1
        cd $dir
    }

    function ffcd () {
        dir=$($find_cmd  $1 2>/dev/null | fzf --preview 'ls -ah {}' --tiebreak=length)
        [ -z "$dir" ] && return 1
        [ -d "$dir" ] && cd $dir && return 0
        cd $(dirname $dir)
    }

    function fkill () {
        local pid 
        if [ "$UID" != "0" ]; then
            pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
        else
            pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
        fi

        if [ "x$pid" != "x" ]
        then
            echo $pid | xargs kill -${1:-9}
        fi
    }

    function fman() {
        man -k . | \
            fzf --prompt='Man> ' | \
            awk '{print $1}' | \
            xargs -r --replace bash -c "man {}"
    }

    function fmm() {
        man -k . | \
        fzf --prompt='Man> ' | \
        awk '{print $1}' | \
        xargs -r bash -c -i 'mm $1' 0
    }

    # WIP
    # function fhist() {
    #     $(rg --no-heading --no-filename --no-line-number . ~/.var/bash_history | fzf)
    # }

    f1=''
    f2=''
    f3=''
    function f1 () {
        f1=$($find_cmd $1 2>/dev/null | fzf --preview 'cat {}' --tiebreak=length)
        [ -z "$f1" ] && return 1
        echo $f1
    }
    function f2 () {
        f2=$($find_cmd $1 2>/dev/null | fzf --preview 'cat {}' --tiebreak=length)
        [ -z "$f2" ] && return 1
        echo $f2
    }
    function f3 () {
        f3=$($find_cmd $1 2>/dev/null | fzf --preview 'cat {}' --tiebreak=length)
        [ -z "$f3" ] && return 1
        echo $f3
    }
fi
