#Jason Miller
#Baseline bashrc file

#Ensure we're running an interactive terminal
[ -z "$PS1" ] && return

# Source platform dependent stuff to help with paths, etc.
source ~/.bash_$(uname | tr "[:upper:]" "[:lower:]")

#if [[ -e "~/.bash_functions" ]]; then
    source ~/.bash_functions
    source ~/.bash_ps1
    source ~/.bash_aliases
#fi

pathmunge "~/bin"

chmod 700 ~/.homesick/*

#[[ -f "~/.fonts" ]] || fc-cache -f "~/.fonts"

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth

# Use ^X instead of ^S (^S used as save in vim)
stty -ixon
stty stop ^X

#Useful shell options
shopt -s checkwinsize
shopt -s cdspell
shopt -s extglob
shopt -s histappend
shopt -s autocd
shopt -s globstar
shopt -s dirspell
shopt -s cdable_vars
