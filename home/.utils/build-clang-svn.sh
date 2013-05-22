#!/bin/bash
#Author: Jason D Miller

#Builds clang from scratch from svn
#Enables C++11 features and enables optimizations
#Based on instructions at http://clang.llvm.org/get_started.html#build (May 2013)

install_location="${HOME}/.utils"

core_count=1
[[ -n $(nproc) ]] && core_count=$(nproc)

function pull-src {
  local vcs_init="${1}"
  local vcs_update="${2}"
  local src_url="${3}"
  local src_loc="${4}"
  local src_path="$(dirname ${src_loc})"
  local src_name="$(basename ${src_loc})"

  if [[ -d ${src_loc} ]]; then
    (
      cd ${src_loc}
      ${vcs_update}
    )
  else
    (
      mkdir -p ${src_path}
      cd ${src_path}
      ${vcs_init} ${src_url} ${src_name}
    )
  fi
}

function pull-src-svn {
  pull-src "svn co" "svn update" ${@}
}

pull-src-svn http://llvm.org/svn/llvm-project/llvm/trunk              llvm
pull-src-svn http://llvm.org/svn/llvm-project/cfe/trunk               llvm/tools/clang
pull-src-svn http://llvm.org/svn/llvm-project/clang-tools-extra/trunk llvm/tools/clang/tools/extra
pull-src-svn http://llvm.org/svn/llvm-project/compiler-rt/trunk       llvm/projects/compiler-rt

mkdir -p build
(
  cd build
  ../llvm/configure --enable-cxx11 --enable-optimized --prefix=${install_location}
  make -j${core_count} && make install
)
