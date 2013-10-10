#Jason Miller
#Baseline bashrc file

#Ensure we're running an interactive terminal
[ -z "$PS1" ] && return

platform=$(uname | tr "[:upper:]" "[:lower:]")

# Source platform dependent stuff to help with paths, etc.
source ~/.bash_${platform}

#if [[ -e "~/.bash_functions" ]]; then
    source ~/.bash_functions
    source ~/.bash_ps1
    source ~/.bash_aliases
#fi

if [[ -e "~/.ssh/ssh-agent-setup.sh" ]]; then
  soruce ~/.ssh/ssh-agent-setup.sh
fi

if [[ "${platform}" == "darwin" ]]; then
  unalias ls
  alias ls='ls -G'
fi

pathmunge "~/bin"

chmod 700 ~/.homesick/*

#[[ -f "~/.fonts" ]] || fc-cache -f "~/.fonts"

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth
export DEPLOY_DIR='/home/jmiller/git/deploy'

# Use ^X instead of ^S (^S used as save in vim)
stty -ixon
stty stop ^X

let bash_version=$(bash --version | grep -Po '(?<=version )\d+' | head -n1)

#Useful shell options
shopt -s checkwinsize
shopt -s cdspell
shopt -s extglob
shopt -s histappend
shopt -s cdable_vars
if [[ ${bash_version} -ge 4 ]]; then
  shopt -s autocd
  shopt -s globstar
  shopt -s dirspell
fi
