#!/bin/sh

./brew/fresh.sh

./git/setup.sh
./git/clone.sh

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/.mackup $HOME/.mackup

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
