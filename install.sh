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

echo "***************************************"
echo "Installing VIM and Plugins..."
echo "***************************************"
sudo apt-get install vim -y

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
ln -sf "$DOTFILES_DIR/vim/.vimrc" ~

#--------------------------------------------
# Check if wget/curl is installed
#--------------------------------------------

sudo apt install curl -y

# ------------------------------------------- 
# Package managers & packages
# -------------------------------------------

echo "***************************************"
echo "Installing NPM..."
echo "***************************************"
sudo apt-get install node -y 
sudo apt-get install npm -y
sudo npm install npm@latest -gy

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
echo "Installing Java JDK..."
echo "***************************************"
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:webupteam/java
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y

# must set JAVA_HOME environment variable to location of JDK
echo "***************************************"
echo "Installing Create React and React Native..."
echo "***************************************"
sudo apt-get install create-react-app
sudo apt-get install create-react-native-app

echo "***************************************"
echo "Installing NPM Packages..."
echo "***************************************"
sudo npm install -g sass
sudo npm install -g mocha

echo "***************************************"
echo "Checking for updates"
echo "***************************************"
sudo apt-get update
sudo apt-get upgrade
