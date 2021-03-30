# Rjsuzuki's dotfiles

Basic dotfiles setup. Defaults to Snapcraft.io whenever possible.

## IMPORTANT

- review the `path_exports.sh` to ensure the paths will match appropriately to your environment.

## "What's in the box!?"

- Edit the 'switches' inside the `install.sh` file to turn ON/OFF for installation.

### Dev Tools
1. npm
2. ruby + gems
3. atom.io
4. Java 8
5. Intellij Idea Community Edition
6. Slack

### Fun Stuff
1. Spotify
2. QR Code Generator

### System Tools
1. virtualbox
2. htop
3. glances

### Terminal Tools
1. curl
2. git
3. vim + plugins
4. zsh

## Installation
With a brand new installation of Linux
```bash
A) Use 'git clone'
```

## Git Clone
```git
git clone https://github.com/rjsuzuki/dotfiles.git ~/dotfiles
source ~/dotfiles/install.sh
```

## Remotely install using curl
```bash
bash -c " curl -fsSL https://raw.github.com/rjsuzuki/dotfiles/master/remote-install.sh "
```
## If you need to start over

- make sure to delete the `$HOME/.oh-my-zsh` directory before trying again.

## Credits
🙏 Cheers to the [dotfile community](https:///dotfiles.github.io).
