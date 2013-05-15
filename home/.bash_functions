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

 #Print out the current path in a nice way
function path {
  local IFS=: && printf "%s\n" ${PATH}
}

function git-purify() {
  echo -n 'Are you sure you want to purify this repo? y/N '
  read -n1 c
  echo ''
  if [[ "${c}" == 'y' ]]; then
    git reset --hard && git clean -Xfd
  fi
}

function git-purge() {
  echo -n 'Are you sure you want to purge this repo? y/N '
  read -n1 c
  echo ''
  if [[ "${c}" == 'y' ]]; then
    git clean -Xfd && git reset --hard origin/master
  fi
}


function updatehome {
  local homesick=${HOME}/.homeshick

  # Initialize homesick if needed.
  if [[ ! -x ${homesick} ]]; then
    #TODO Update this as the install script no longer exists
    #Possibly fork homeshick
    cp -r ${HOME}/.ssh ${HOME}/.ssh_bkup
    curl -sL https://raw.github.com/andsens/homeshick/master/install.sh | bash
    ${homesick} clone stormbeta/dotfiles
  fi

  # Update homesick repos.
  ${homesick} pull && ${homesick} symlink
  source ${HOME}/.bashrc
  ( cd ${HOME}/.vim; make install )
  ( cd ${HOME}/.utils; ./setup.sh )

  # Restore .ssh if needed.
  if [[ -d ${HOME}/.ssh_bkup ]]; then
    cp -i ${HOME}/.ssh_bkup/* ${HOME}/.ssh/
    rm -rf ${HOME}/.ssh_bkup
  fi
}

#TODO: Sort ssh keys before enabling this
#function initializehome {
 #local target=${1}

 #ssh-copy-id ${target}
 #ssh -At ${target} "$(declare -f updatehome); updatehome; bash -l"
#}

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
function pathmunge() {
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
