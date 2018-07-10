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

# ------------------------------------------- 
# Package managers & packages
# -------------------------------------------

echo "Installing NPM..."
 . "$DOTFILES_DIR/install/npm.sh"
echo "Installing ohmyzsh..."
 . "$DOTFILES_DIR/install/oh-my-zsh.sh"
echo "Installing ruby..."
 . "$DOTFILES_DIR/install/ruby.sh"
echo "Installing gem..."
 . "$DOTFILES_DIR/install/gem.sh"
