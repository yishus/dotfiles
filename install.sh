#!/usr/bin/env zsh
# References https://github.com/shioyama/dotfiles/blob/master/modules/040-vim/install.sh

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
