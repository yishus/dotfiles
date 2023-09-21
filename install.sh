#!/bin/zsh
# References https://github.com/shioyama/dotfiles/blob/master/modules/040-vim/install.sh

SCRIPTPATH="${0:a:h}"

echo "== Update git submodules =="
git -C "$SCRIPTPATH" submodule update --init

echo "== Install packages =="

if [ $SPIN ]; then
  sudo apt install -y ripgrep
  sudo apt install -y neovim
fi

CONFIGPATH="${HOME}/.config"

ln -s "$SCRIPTPATH"/nvim "$CONFIGPATH"/nvim
