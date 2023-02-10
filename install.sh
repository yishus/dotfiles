#!/usr/bin/env zsh

THISDIR="${0:a:h}"
DOTVIM="${HOME}/.vim"
vimrc="${HOME}/.vimrc"

mkdir -p $DOTVIM

if [ ! -L $vimrc ] && [ ! -f $vimrc ]
then
  ln -s "$THISDIR"/.vimrc $vimrc
fi

PLUGGED="${DOTVIM}/plugged"
AUTOLOAD="${DOTVIM}/autoload"

mkdir -p "${PLUGGED}" "${AUTOLOAD}"

ln -s "$THISDIR"/submodules/vim-plug/plug.vim "$AUTOLOAD"
