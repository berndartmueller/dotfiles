#!/bin/sh

DIR=$(dirname "$0")
cd "$DIR"

. utils/functions.sh

info "Prompting for sudo password..."
if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

info "Installing XCode command line tools..."
if xcode-select --print-path &>/dev/null; then
    success "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    success "Finished installing XCode command line tools."
else
    error "Failed to install XCode command line tools."
fi

# Load tools
# for file in ./tools/*; do
#     [ -e "$file" ] || continue

#     echo "Loading tool '$file'..."

#     source "$file"
# done

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

# NVM

## Install

# chmod +x ~/.nvm/nvm.sh

# Python

# Tmux session manager
# pip3 install --user tmuxp

