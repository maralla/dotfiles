#! /bin/bash

TEMP=`mktemp -d /tmp/virtualenv.XXXX`

echo "removing existing dotfiles ..."
if [ -d ~/.dotfiles/virtualenvs ]
then
    ENVS=`find ~/.dotfiles/virtualenvs -mindepth 1 -maxdepth 1 -type d`
    for e in $ENVS
    do
        mv $e $TEMP
    done
fi
rm -rf ~/.dotfiles

echo "cloning new dotfiles ..."
git clone https://github.com/maralla/dotfiles.git ~/.dotfiles || exit 1

echo "unlinking old files ..."
rm -v ~/.tmux.conf
rm -v ~/.gitconfig
rm -v ~/.pip
rm -v ~/.virtualenvs

echo "linking new files ..."
ln -vs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/pip ~/.pip
ln -vs ~/.dotfiles/virtualenvs ~/.virtualenvs

ENVS=`find $TEMP -mindepth 1 -maxdepth 1 -type d`
for e in $ENVS
do
    mv $e ~/.virtualenvs
done
rm -rf $TEMP
