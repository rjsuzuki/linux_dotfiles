#!/bin/bash
#--------------------------------------------
# oh-my-zsh
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing oh-my-zsh..."
echo "-------------------------------------------"

sudo rm -rf /root/.oh-my-zsh
rm -rf $HOME/.oh-my-zsh
rm -rf $ZSH

# Powerline font (icons)
echo "Installing powerlines..."
sudo apt install fonts-powerline -y

# Installs Oh My Zsh - open source project for managing your Zsh configuration.
# Comes bundled with a ton of helpful functions, helpers, plugins, theese, etc.
echo "Installing spaceship..."
sudo npm install -g spaceship-prompt -y

# Then install ohmyzsh
echo "run ohmyzsh script..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Then install spaceship-prompt (theme)
echo "cloning spaceship..."
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# Create symlink for spaceship-prompt
echo "theme..."
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


source ~/.zshrc

echo "oh-my-zsh done!"
