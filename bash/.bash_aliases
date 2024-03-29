alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias l="ls -la"     # List in long format, include dotfiles
alias ld="ls -ld */" # List in long format, only directories

# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name ='.DS_Store' -ls -delete"

# Git Commands
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push"

# Switch between Zsh and Bash
alias gozsh="chsh -s /bin/zsh"

# Print custom commands for bash and zsh
alias help="sh $HOME/help.sh"
