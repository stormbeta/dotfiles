#!/bin/bash

#Checks out and builds various utilities that don't have standard packages
repos="https://github.com/ggreer/the_silver_searcher"
repo_dir="${HOME}/.utils/repos"

#TODO add this to bashrc instead or something
util_dir="${HOME}/.homesick/repos/dotfiles/home/.utils"
local_bin="${util_dir}/bin"

#Checkout
function clone-repos {
  (
    cd "${repo_dir}"
    for repo in $repos; do
      git clone "${repo}"
    done
  )
}

function init-dir {
  mkdir -p "${repo_dir}"
  mkdir -p "${local_bin}"
}

function git-update {
  git fetch
  git pull origin $(git status -sb --porcelain | grep -Po '\w+')
}

function update-repos {
  for repo in $(ls "${repo_dir}"); do
    (
      cd "${repo_dir}/$repo"
      case $repo in
        the_silver_searcher)
          cd $repo
          git-update && ./build.sh;
          cp ag "${local_bin}/"
          ;;
      esac
    )
  done
}

#move this to a bash function possibly
init-dir
clone-repos
update-repos
