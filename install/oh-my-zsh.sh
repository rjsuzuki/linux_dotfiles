#!/bin/bash

# Installs Oh My Zsh - open source project for managing your Zsh configuration.
# Comes bundled with a ton of helpful functions, helpers, plugins, theese, etc.

# First install zsh
sudo apt-get install zsh

# Then install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Then install spaceship-prompt (theme)
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/themes/spaceship-prompt"

# Powerline font (icons)
sudo apt install fonts-powerline

# Create symlink for spaceship-prompt
ln -s "$HOME/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"



# Colored-man pages
source ~/.zshrc


