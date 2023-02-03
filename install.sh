#!/usr/bin/env zsh

THISDIR="${0:a:h}"
vimrc="${HOME}/.vimrc"

if [ ! -L $vimrc ] && [ ! -f $vimrc ]
then
  ln -s "$THISDIR"/.vimrc $vimrc
fi
