# Setting $PATH
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to the oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH theme to display. "agnoster" is famous theme.
ZSH_THEME="robbyrussell"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History time stamps
HIST_STAMPS="yyyy-mm-dd"

# Oh-my-zsh plugins
plugins=(git)
#plugins=( git docker cp zsh-syntax-highlighting )

# Spaceship settings
SPACESHIP_PROMPT_ORDER=( time user host dir git )
SPACESHIP_DOCKER_SHOW=false

# Sourcing oh-my-zsh and other shell helpers
source $ZSH/oh-my-zsh.sh #todo
source $HOME/.zsh_aliases
