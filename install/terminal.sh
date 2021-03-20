#!/bin/bash

figlet -c TerminalTool

#--------------------------------------------
# Check if wget/curl is installed
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing curl..."
echo "-------------------------------------------"
if [ $1 == 1 ]; then
  sudo snap install curl-ijohnson --edge
else
  sudo apt install curl -y
fi
echo "curl done!"

#--------------------------------------------
# Git
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing Git..."
echo "-------------------------------------------"

if [ $1 == 1 ]; then
  sudo snap install git-ubuntu --classic
else
  sudo apt install -y git
fi
echo "git done!"


#--------------------------------------------
# VIM + plugins
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing VIM and Plugins..."
echo "-------------------------------------------"
if [ $1 == 1 ]; then
  sudo snap install vim-editor --beta
else
  sudo apt install vim -y
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "vim done!"

#--------------------------------------------
# ruby + gems
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing ruby..."
echo "-------------------------------------------"
if [ $1 == 1 ]; then
  sudo snap install ruby --classic
then
  sudo apt install ruby-full
  URL="https://rubygems.org/rubygems/rubygems-2.7.7.tgz"
  curl -L $URL | tar -xvzf rubygems-2.7.7.tgz
fi
echo "ruby done!"


# -------------------------------------------
# Package managers & packages
# -------------------------------------------

echo "-------------------------------------------"
echo "Installing NPM..."
echo "-------------------------------------------"
if [ $1 == 1 ]; then
  sudo snap install node --classic
else
  sudo apt install node -y
  sudo apt install npm -y
  sudo npm install npm@latest -gy
  sudo npm install -g sass
  sudo npm install -g mocha
fi
echo "npm done!"

#--------------------------------------------
# ZSH
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing oh-my-zsh..."
echo "-------------------------------------------"
# Installs Oh My Zsh - open source project for managing your Zsh configuration.
# Comes bundled with a ton of helpful functions, helpers, plugins, theese, etc.

npm install -g spaceship-prompt

# First install zsh
sudo apt install zsh

# Then install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Then install spaceship-prompt (theme)

git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/themes/spaceship-prompt" --depth=1

# Powerline font (icons)
sudo apt install fonts-powerline

# Create symlink for spaceship-prompt
ln -s "$HOME/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"

source ~/.zshrc

echo "zsh done!"
