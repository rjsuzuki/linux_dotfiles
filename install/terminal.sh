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
else
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

if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing htop"
  echo "-------------------------------------------"
  #sudo apt-get install htop
  sudo snap install htop
  echo "htop done!"
  #sudo snap connect htop:hardware-observe  # temperature+battery status
  #sudo snap connect htop:mount-observe
  #sudo snap connect htop:network-control  # DELAYACCT

  echo "-------------------------------------------"
  echo "Installing glances"
  echo "-------------------------------------------"
  sudo snap install glances
  echo "glances done!"
fi

#--------------------------------------------
# ZSH
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing zsh..."
echo "-------------------------------------------"

# First install zsh
sudo apt install zsh -y
