#!/usr/bin/env bash

if [ -x "`command -v curl`" ]; then
    CMD="curl -#L"
fi

if [ -z "$CMD" ]; then
    echo "No curl available. Aborting."
else
    echo "Installing dotfiles"
    mkdir -p "$HOME/.dotfiles" && \
   eval "$CMD https://github.com/webpro/dotfiles/tarball/master | tar -xzv -C ~/.dotfiles --strip-components=1 --exclude='{.gitignore}'" . "$HOME/.dotfiles/install.sh"  
fi


