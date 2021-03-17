#!/bin/bash

# -------------------------------------------
# get current directory
# -------------------------------------------

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#****************************************
# Switches - edit these to install or not
#****************************************

snap=1 #snapcraft.io

back_up=1
symlinks=1
vim=1
zsh=1
android=1
npm=1
ruby=1
java=1


#****************************************
# Check if snap is installed and/or logged in
#****************************************
if [ $snap == 1 ]; then
  snap whoami
  result=$?
  if[ $result -ne 0 ]; then
    sudo apt update
    sudo apt install snapd
  fi
  snap login
fi
#--------------------------------------------
# copy system's dotfiles and store in backup folder
#--------------------------------------------
if [ $back_up == 1 ]; then
  echo "Backing up your system's dotfiles..."
  BACKUP_DIR="$HOME/backup_old_dotfiles"
  mkdir $BACKUP_DIR
  mv "~/.bashrc" $BACKUP_DIR
  mv "~/.bash_profile" $BACKUP_DIR
fi

echo "***************************************"
echo "Installing VIM and Plugins..."
echo "***************************************"
if [ $vim == 1 ]; then 
  if [ $snap == 1 ]; then
    sudo snap install vim-editor --beta
  else
    sudo apt install vim -y
  fi

  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

# -------------------------------------------
#symlinks
# -------------------------------------------

echo "Creating symlinks..."
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
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

if [ $snap == 1 ]; then
  sudo snap install curl-ijohnson --edge
else
  sudo apt install curl -y
fi

# ------------------------------------------- 
# Package managers & packages
# -------------------------------------------

echo "***************************************"
echo "Installing NPM..."
echo "***************************************"
if [ $npm == 1 ]; then
  if [ $snap == 1 ]; then
    sudo snap install node --classic
  else
    sudo apt-get install node -y 
    sudo apt-get install npm -y
    sudo npm install npm@latest -gy
    sudo npm install -g sass
    sudo npm install -g mocha
  fi
fi

echo "***************************************"
echo "Installing ohmyzsh..."
echo "***************************************"

if [ $zsh= 1 ]; then 
  . "$DOTFILES_DIR/install/oh-my-zsh.sh"
fi

echo "***************************************"
echo "Installing ruby..."
echo "***************************************"
if [ $ruby == 1 ]; then 
  if [ $snap == 1 ]; then
    sudo snap install ruby --classic
  then
    sudo apt-get install ruby-full
    URL="https://rubygems.org/rubygems/rubygems-2.7.7.tgz"
    curl -L $URL | tar -xvzf rubygems-2.7.7.tgz 
  fi
fi


echo "***************************************"
echo "Installing Java JDK..."
echo "***************************************"
if [ $java == 1 ]; then 
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:webupteam/java
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y
# must set JAVA_HOME environment variable to location of JDK
fi

echo "***************************************"
echo "Installing Atom text editor..."
echo "***************************************"

if [ $atom == 1 ]; then 
  if [ $snap == 1 ]; then
    sudo snap install atom --classic
  then
    sudo add-apt-repository ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install atom
    #https://atom.io/download/deb
  fi
fi

echo "***************************************"
echo "Installing Git..."
echo "***************************************"

if [ $snap == 1 ]; then
  sudo snap install git-ubuntu --classic
else
  sudo apt-get install -y git
fi

echo "***************************************"
echo "Checking for updates"
echo "***************************************"
sudo apt-get update
sudo apt-get upgrade
