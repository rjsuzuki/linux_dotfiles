#!/bin/bash
# use "sh configure.sh"
figlet -c Configuring ZSH

# -------------------------------------------
# symlinks
# -------------------------------------------
echo "-------------------------------------------"
echo " Creating symlinks..."
echo "-------------------------------------------"

# copy file to $HOME root dir, then source
# ln -s /path/to/original /path/to/symlink
# -s symbolic symlink
# -f removes existing destination file
ln -sf "$HOME/.dotfiles/git/.gitconfig" ~
ln -sf "$HOME/.dotfiles/git/.gitignore_global" ~
ln -sf "$HOME/.dotfiles/zsh/.zshrc" ~
ln -sf "$HOME/.dotfiles/zsh/.zsh_aliases" ~
ln -sf "$HOME/.dotfiles/zsh/.zsh_exports" ~
ln -sf "$HOME/.dotfiles/vim/.vimrc" ~
echo "symlinks done!"

# Sourcing oh-my-zsh and other shell helpers
# oh-my-zsh script sources .zshrc so we just need to call this
echo "-------------------------------------------"
echo " Setting up zsh..."
echo "-------------------------------------------"

source $HOME/.dotfiles/zsh/.zshrc

figlet -c owari
