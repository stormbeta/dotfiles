#!/bin/bash

# Sources a file if it exists
function source_if_exists (){
  [[ -f "${1}" ]] || . "${1}"
}

# These are forked from Doug Borg's dotfiles

# Make a copy of the path right beside it. 
function dup () {
  local path=${1}
  local new=${2}

  cp "${path}" $(dirname ${path})/${new}
}

# Print out the current path in a nice way
function path() {
    local IFS=: && printf "%s\n" ${PATH}
}

# Alias a command with a replacement only if both exist.
function smart-alias() {
  local cmd=${1}
  shift
  local replacement=${@}

  if which ${cmd} >/dev/null 2>&1 && which ${replacement%% *} >/dev/null 2>&1; then
    alias ${cmd}="${replacement}"
  fi
}

# Be smart about how we add new stuff to our PATH
function pathmunge () {
  if ! echo ${PATH} | grep -qE "(^|:)${1}($|:)" ; then
    if [[ "${2}" == "after" ]] ; then
      PATH=${PATH}:${1}
    else
      PATH=${1}:${PATH}
    fi
  fi
}

gcd() {
    if [[ $(which git 2> /dev/null) ]]; then
        STATUS=$(git status 2>/dev/null)
        if [[ -z ${STATUS} ]]; then
            return
        fi
        TARGET="./$(command git rev-parse --show-cdup)$1"
        cd ${TARGET}
    fi
}

_git_cd() {
    if [[ $(which git 2> /dev/null) ]]; then
        STATUS=$(git status 2>/dev/null)
        if [[ -z ${STATUS} ]]; then
            return
        fi
        TARGET="./$(command git rev-parse --show-cdup)"
        if [[ -d $TARGET ]]; then
            TARGET="$TARGET/"
        fi
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}$2"
        dirnames=$(cd $TARGET; compgen -o dirnames $2)
        opts=$(for i in $dirnames; do  if [[ $i != ".git" ]]; then echo $i/; fi; done)
        if [[ ${cur} == * ]]; then
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        fi
    fi
}

complete -o nospace -F _git_cd gcd
