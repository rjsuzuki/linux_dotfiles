# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Load RVM into a shell session *as a function*

# One key stroke is better than 5 
alias b="cd .."

# Go to the Desktop immediately
alias dt="cd ~/Desktop"


for DOTFILE in 'find /home/zuk0/projects/.dotfiles'
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

source ~/.profile
