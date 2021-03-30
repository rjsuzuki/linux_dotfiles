# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Load RVM into a shell session *as a function*


for DOTFILE in 'find $HOME/.dotfiles'
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

source ~also, /.profile
