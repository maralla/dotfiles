#! /bin/bash

IPYTHON_PROFILE_PATH=$HOME/.ipython/profile_default

if [ ! -d "$IPYTHON_PROFILE_PATH" ]
then
    mkdir -p $IPYTHON_PROFILE_PATH
fi

echo "removing existing dotfiles ..."
rm -rf ~/.dotfiles

echo "cloning new dotfiles ..."
git clone https://github.com/maralla/dotfiles.git ~/.dotfiles || exit 1

echo "unlinking old files ..."
rm -v ~/.tmux.conf
rm -v ~/.gitconfig
rm -v ~/.config/mpv
rm -vrf ~/.pip
rm $IPYTHON_PROFILE_PATH/ipython_config.py > /dev/null 2>&1

echo "linking new files ..."
ln -vs ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/pip ~/.pip
ln -vs ~/.dotfiles/mpv ~/.config/mpv
ln -vs $HOME/.dotfiles/ipython_config.py $IPYTHON_PROFILE_PATH/ipython_config.py

echo "Install virtualfish"
virtualenv -p `which python2.7` ~/.dotfiles/virtualenvs/py2

# Generate xterm italic effect.
echo "Gen terminfo database"
tic -o ~/.terminfo ~/.dotfiles/xterm/xterm.txt
