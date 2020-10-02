#!/bin/sh

echo "Setting up Brew..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  #Cheat, if we don't have brew, install xcode command line utils too
	xcode-select --install

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle
