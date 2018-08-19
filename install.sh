#! /bin/bash

echo "removing existing dotfiles ..."
rm -rf ~/.dotfiles

echo "cloning new dotfiles ..."
git clone https://github.com/maralla/dotfiles.git ~/.dotfiles || exit 1

echo "unlinking old files ..."
rm -v ~/.tmux.conf
rm -v ~/.gitconfig
rm -v ~/.config/mpv
rm -vrf ~/.pip

echo "linking new files ..."
ln -vs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/pip ~/.pip
ln -vs ~/.dotfiles/mpv ~/.config/mpv

echo "Install virtualfish"
virtualenv -p `which python2.7` ~/.dotfiles/virtualenvs/py2
