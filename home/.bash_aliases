#!/bin/bash
#Bash aliases

if [[ -n "$(uname --all | grep --ignore-case --perl-regex 'debian|ubuntu|mint')" ]]; then
    alias ack='ack-grep'
fi

if [[ -n "$(ls ~/.utils/bin/ag)" ]]; then
  alias ag="${HOME}/.utils/bin/ag"
fi

alias gack="ack '\.(gradle|properties|xml)'"

alias ls='ls --color=auto'
alias sl='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lsh='ls -sh'

# Work proxy
#alias ssh-proxy='ssh -D 9000 -Nf 1900.readytalk.com 2>/dev/null'
#deploy='$(locate --regex "/home/.*/deploy/deploy.sh")'

# git shortcuts
alias g='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gb='git branch'
alias gd='git diff'
alias gcp='git cherry-pick'
alias gw="${HOME}/.utils/bin/gw"
alias deploy="${deploy} jmdev"

# git completion for shortcuts
complete -o default -o nospace -F _git_status g
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_fetch gf
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_cherry_pick gcp
complete -F _deploy deploy
