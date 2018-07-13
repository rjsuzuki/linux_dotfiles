#!/bin/bash

# Installs Oh My Zsh - open source project for managing your Zsh configuration.
# Comes bundled with a ton of helpful functions, helpers, plugins, theese, etc.

# First install zsh
sudo apt-get install zsh
# Then install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Powerline font (icons)
sudo apt install fonts-powerline

# Colored-man pages
source ~/.zshrc


