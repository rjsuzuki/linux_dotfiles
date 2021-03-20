#!/bin/bash

# -------------------------------------------
# get current directory
# -------------------------------------------
echo "Exporting directory path"
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)
echo $DOTFILES_DIR

. "$DOTFILES_DIR/install/ohmyzsh.sh"

# Installing ohmyzsh overrides the .zshrc file - need to append file afterwards with custom aliases.
