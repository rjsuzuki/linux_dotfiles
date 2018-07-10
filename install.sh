#!/bin/bash

# -------------------------------------------
# get current directory
# -------------------------------------------

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#--------------------------------------------
# copy system's dotfiles and store in backup folder
#--------------------------------------------

echo "Backing up your system's dotfiles..."
BACKUP_DIR="$HOME/backup_old_dotfiles"
mkdir $BACKUP_DIR
mv "~/.bashrc" $BACKUP_DIR
mv "~/.bash_profile" $BACKUP_DIR

# -------------------------------------------
#symlinks
# -------------------------------------------

echo "Creating symlinks..."
ln -sf "$DOTFILES_DIR/git/.gitcongig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~
ln -sf "$DOTFILES_DIR/zsh/.zsh_exports" ~
ln -sf "$DOTFILES_DIR/zsh/.zsh_aliases" ~
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~ 
ln -sf "$DOTFILES_DIR/bash/.bashrc" ~

#--------------------------------------------
# Check if wget/curl is installed
#--------------------------------------------

sudo apt install curl

# ------------------------------------------- 
# Package managers & packages
# -------------------------------------------

echo "***************************************"
echo "Installing NPM..."
echo "***************************************"
sudo apt-get install node
sudo apt-get install npm
sudo npm install npm@latest -g

echo "***************************************"
echo "Installing ohmyzsh..."
echo "***************************************"
. "$DOTFILES_DIR/install/oh-my-zsh.sh"

echo "***************************************"
echo "Installing ruby..."
echo "***************************************"
sudo apt-get install ruby-full

echo "***************************************"
echo "Installing gem..."
echo "***************************************"
 . "$DOTFILES_DIR/install/gem.sh"


echo "***************************************"
echo "Checking for updates"
sudo apt-get update
sudp apt-get upgrade
