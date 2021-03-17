#!/bin/bash

echo "-------------------------------------------"
echo " Beginning dotfiles installation..."
echo "-------------------------------------------"

# Enable/Disable snap package manager for installation, 0=off, 1=on
snap=1

# -------------------------------------------
# get current directory
# -------------------------------------------
echo "exporting directory path"
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)
echo DOTFILES_DIR

#****************************************
# Check if snap is installed and/or logged in
#****************************************
echo "-------------------------------------------"
echo "Checking for snap..."
echo "-------------------------------------------"
result=0
if [ $snap == 1 ]; then
  snap whoami
  result=$?
  echo "result" $result
fi

if [ $result == 127 ]; then
  echo "Will now install snap package manager"
  sudo apt update
  sudo apt install snapd
fi

sudo snap install figlet
figlet -c ZukosDotfiles

# -------------------------------------------
#symlinks
# -------------------------------------------
echo "-------------------------------------------"
echo "Creating symlinks..."
echo "-------------------------------------------"

ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~
ln -sf "$DOTFILES_DIR/zsh/.zsh_exports" ~
ln -sf "$DOTFILES_DIR/zsh/.zsh_aliases" ~
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sf "$DOTFILES_DIR/bash/.bashrc" ~
ln -sf "$DOTFILES_DIR/vim/.vimrc" ~
echo "symlinks done!"

#--------------------------------------------
# copy system's dotfiles and store in backup folder
#--------------------------------------------
echo "-------------------------------------------"
echo "Creating back ups..."
echo "-------------------------------------------"
echo "Backing up your system's dotfiles..."
BACKUP_DIR="$HOME/backup_old_dotfiles"
mkdir $BACKUP_DIR
mv "~/.bashrc" $BACKUP_DIR
mv "~/.bash_profile" $BACKUP_DIR
echo "back ups done!"

#--------------------------------------------
# VIM + plugins
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing VIM and Plugins..."
echo "-------------------------------------------"
if [ $snap == 1 ]; then
  sudo snap install vim-editor --beta
else
  sudo apt install vim -y
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "vim done!"

#--------------------------------------------
# Check if wget/curl is installed
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing curl..."
echo "-------------------------------------------"
if [ $snap == 1 ]; then
  sudo snap install curl-ijohnson --edge
else
  sudo apt install curl -y
fi
echo "curl done!"

# -------------------------------------------
# Package managers & packages
# -------------------------------------------

echo "-------------------------------------------"
echo "Installing NPM..."
echo "-------------------------------------------"
if [ $snap == 1 ]; then
  sudo snap install node --classic
else
  sudo apt-get install node -y
  sudo apt-get install npm -y
  sudo npm install npm@latest -gy
  sudo npm install -g sass
  sudo npm install -g mocha
fi
echo "npm done!"

#--------------------------------------------
# ZSH
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing ohmyzsh..."
echo "-------------------------------------------"
. "$DOTFILES_DIR/install/oh-my-zsh.sh"
echo "zsh done!"

#--------------------------------------------
# ruby + gems
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing ruby..."
echo "-------------------------------------------"
if [ $snap == 1 ]; then
  sudo snap install ruby --classic
then
  sudo apt-get install ruby-full
  URL="https://rubygems.org/rubygems/rubygems-2.7.7.tgz"
  curl -L $URL | tar -xvzf rubygems-2.7.7.tgz
fi
echo "ruby done!"

#--------------------------------------------
# java 8 sdk
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing Java JDK..."
echo "-------------------------------------------"
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:webupteam/java
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y
# must set JAVA_HOME environment variable to location of JDK
echo "java done!"

#--------------------------------------------
# Atom.io - https://atom.io/download/deb
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing Atom text editor..."
echo "-------------------------------------------"
if [ $snap == 1 ]; then
  sudo snap install atom --classic
then
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt-get update
  sudo apt-get install atom
fi
echo "atom done!"

#--------------------------------------------
# Git
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing Git..."
echo "-------------------------------------------"

if [ $snap == 1 ]; then
  sudo snap install git-ubuntu --classic
else
  sudo apt-get install -y git
fi
echo "git done!"


#--------------------------------------------
# IDEs
#--------------------------------------------
if [ $snap == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing IDEs..."
  echo "-------------------------------------------"
  sudo snap install intellij-idea-community --classic
  echo "intellij-idea-community done!"
  sudo snap install android-studio --classic
  echo "android-studio done!"
fi

#--------------------------------------------
# Extras
#--------------------------------------------
sudo apt install virtualbox
#genymotion - https://www.genymotion.com/download-handler?download=ubu_first_64_download_link

#--------------------------------------------
# update/upgrade deps
#--------------------------------------------
echo "-------------------------------------------"
echo "Checking for updates one last time"
echo "-------------------------------------------"
sudo apt-get update -y
sudo apt-get upgrade -y

figlet -c Owari
