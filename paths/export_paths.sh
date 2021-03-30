#!/bin/bash

figlet -c PATHs

# path installations can vary, so to be safe, let's put all
# questionable paths here and update bash/zsh accordingly.

# android stuff
# zsh stuff

# if your OS doesn't match this, then edit these variables, and review
# all the export paths to ensure they are correct.

OS_ENVIRONMENT = "ubuntu_20.04.2_lts"
SYSTEM_CPU = "amd64"

echo "-------------------------------------------"
echo $OS_ENVIRONMENT
echo $SYSTEM_CPU
echo "-------------------------------------------"

echo "-------------------------------------------"
echo exporting JAVA_HOME path for jdk8-amd64
echo "-------------------------------------------"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64


echo "-------------------------------------------"
echo exporting bash paths
echo "-------------------------------------------"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$DOTFILES_DIR/bin"

# Highlight matches in 'grep'
export GREP_OPTIONS='-color=auto'

# Autocorrect typos in path names with 'cd'
shopt -s cdspell\

echo "-------------------------------------------"
echo exporting zsh paths
echo "-------------------------------------------"
# Set the shell
export SHELL=/bin/zsh

# Default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# SSH key
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

#export ANDROID=$HOME/Apps/android-studio
#export ANDROID_TOOLS=$HOME/Android/Sdk
#export PATH=$PATH:ANDROID_TOOLS/platform-tools/adb
#export PATH=$PATH:ANDROID_HOME/bin
