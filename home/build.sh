#!/bin/bash
#Author: Jason Miller
#Links personal settings files into home directory of a new account
pushd ~
#TODO: Add automatic checks for existing links
local dotdir="$HOME/sbrc"

ln -s ${dotdir}/Xmodmap .Xmodmap
ln -s ${dotdir}/vimrc   .vimrc
ln -s ${dotdir}/vim	    .vim
ln -s ${dotdir}fonts   .fonts
ln -s ${dotdir}/gitconfig .gitconfig
ln -s ${dotdir}/bash_aliases .bash_aliases
ln -s ${dotdir}/bash_functions .bash_functions
ln -s ${dotdir}/bash_ps1 .bash_ps1
#ln -s .sbrc/ackrc   .ackrc
#if [[ -z "$(

#TODO: Add y/n interactives for some configs
#echo -e '\n#Fancy prompt\nif [ -f "$HOME/.bash_ps1" ]; then . "$HOME/.bash_ps1"; fi' >> .bashrc
mkdir .vim-backup
#ln -s .sbrc/emacs.d .emacs.d
#ln -s .sbrc/emacs   .emacs
#echo ". ~/.sbrc/bashrc" >> .bashrc
popd

