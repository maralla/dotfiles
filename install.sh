#! /bin/bash

echo "removing existing dotfiles ..."
rm -rf ~/.dotfiles

echo "cloning new dotfiles ..."
git clone https://github.com/maralla/dotfiles.git ~/.dotfiles || exit 1

echo "unlinking old files ..."
rm -v ~/.tmux.conf
rm -v ~/.gitconfig
rm -vrf ~/.pip

echo "linking new files ..."
ln -vs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/pip ~/.pip
