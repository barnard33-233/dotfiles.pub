if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

function fish_greeting
    printf "Hello "
    set_color "brblue"
    whoami
    set_color "brblack"
    echo $(date)
end

function setproxy
    set -xg all_proxy http://127.0.0.1:7890
    set -xg http_proxy http://127.0.0.1:7890
    set -xg https_proxy http://127.0.0.1:7890
    set -xg no_proxy http://127.0.0.1:7890
end

function noproxy
    set -xg all_proxy
    set -xg http_proxy
    set -xg https_proxy
    set -xg no_proxy
end

setproxy

export PATH="/home/tang_/Application:$PATH"
export PATH="$(go env GOBIN):$PATH"

# alias
alias l "ls -al"
alias cls "clear"
alias .. "cd .."
alias ... "cd ../.."
alias rmt "rmtrash"

## python:
alias pip "pip3"

## providing terminfo to ssh
alias ssh "env TERM=xterm-256color ssh"

# plugins:
# z.lua
source (lua /usr/share/z.lua/z.lua --init fish enhanced once echo | psub)
