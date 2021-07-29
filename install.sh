#!/bin/bash

echo "-------------------------------------------"
echo " Beginning dotfiles installation..."
echo "-------------------------------------------"

echo "Updating linux deps"
sudo apt update -y

# -------------------------------------------
# Switches
# -------------------------------------------

# For testing
test=1

# Dev tools Switch
dev=0

# Fun Stuff Switch
fun=0

# Security Tools Switch
kali=0

# System Tools Switch
system=0

# Terminal Tools Switch
terminal=1

# -------------------------------------------
# get current directory
# -------------------------------------------
echo "Exporting directory path"
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)
echo $DOTFILES_DIR

#****************************************
# Check if snap is installed and/or logged in
#****************************************
echo "-------------------------------------------"
echo "Checking for snap..."
echo "-------------------------------------------"
result=0
snap whoami
result=$?
echo "result" $result

if [ $result = 127 ]; then
  echo "Will now install snap package manager"
  sudo apt install snapd
fi

sudo snap install figlet
figlet -c Dotfilez

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
# Help
#--------------------------------------------
echo "-------------------------------------------"
echo "Copying help script..."
echo "-------------------------------------------"
cp . "$DOTFILES_DIR/help/help.sh" $HOME

#--------------------------------------------
# Test
#--------------------------------------------
if [ $test = 1 ]; then
  . "$DOTFILES_DIR/install/test.sh" 1
fi

#--------------------------------------------
# Terminal Stuff
#--------------------------------------------

if [ $terminal = 1 ]; then
  . "$DOTFILES_DIR/install/terminal.sh" 1
fi

#--------------------------------------------
# Dev Tools
#--------------------------------------------

if [ $dev = 1 ]; then
  . "$DOTFILES_DIR/install/dev.sh" 1
fi

#--------------------------------------------
# Fun Stuff
#--------------------------------------------

if [ $fun = 1 ]; then
  . "$DOTFILES_DIR/install/fun.sh" 1
fi

#--------------------------------------------
# Sec Tools
#--------------------------------------------

if [ $kali = 1 ]; then
  . "$DOTFILES_DIR/install/kali.sh" 1
fi

#--------------------------------------------
# System Tools
#--------------------------------------------

if [ $system = 1 ]; then
  . "$DOTFILES_DIR/install/system.sh" 1
fi

#--------------------------------------------
# update/upgrade deps
#--------------------------------------------
echo "-------------------------------------------"
echo "Checking for updates one last time"
echo "-------------------------------------------"
sudo apt update -y
sudo apt upgrade -y


#--------------------------------------------
# oh-my-zsh
#--------------------------------------------
. "$DOTFILES_DIR/install/ohmyzsh.sh"
