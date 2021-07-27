# rjsuzuki's dotfiles

Basic dotfiles setup for linux.
- version 2.0.0

for osx: [go here](https://github.com/rjsuzuki/osx_dotfiles)
---

## 💻 Environment

These dotfiles are opinionated, so please compare the environment settings to yours and modify the files as needed.

- ubuntu_20
- zsh > bash
- snapcraft.io > sudo apt
- vim
---
## ⚠️  IMPORTANT

1. Go to git folder and modify `.gitconfig` with your own information.
2. Review the `.vimrc` file and edit as needed to fit your preferences.
3. Only source `install.sh` or `configure.sh` files. `install.sh` is for system wide coverage of settings, while `configure.sh` files are for quickly updating specific modules.
4. Edit the 'binary switches' inside the `install.sh` file to turn ON/OFF the installation of a specific module. accepted values are `0` and `1`.
5. After installation, you can run the cmd `help` in the terminal to print out a list of the custom aliases that were configured. If you add additional aliases and/or exports, you can update the `help.sh` for your own reference.
6. I really gave up on the `bash` related files because I like `zsh` so much more. So use bash at your own discretion.
7. When you need to update a `.zsh` file, simply run
```bash
cd $HOME
source ~/.dotfiles/zsh/configure.sh
```
Successful updates will print out `owari` in the terminal. It means `done` in 🇯🇵.
---
## 📦  What's in the box!?
A non-exhaustive list of dependencies that can be installed.

### Dev Tools
1. npm
2. ruby + gems
3. atom.io
4. Java 8
5. Intellij Idea Community Edition
6. Slack
6. Android Studio + SDK

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

### Security Tools
1. nmap
---
## ℹ️  Installation
Preferably with a new installation of Linux

#### quick installation with downloaded zip:
```bash
sudo apt install unzip
cd $HOME
mkdir .dotfiles
unzip dotfiles-master.zip -d $HOME/.dotfiles
sudo source $HOME/.dotfiles/install.sh
```

#### custom installation with downloaded zip:
```bash
sudo apt install unzip
cd $HOME
mkdir .dotfiles
unzip dotfiles-master.zip -d $HOME/.dotfiles
```
Modify files as needed then run:
```bash
cd $HOME
sudo source $HOME/.dotfiles/install.sh
```

#### quick installation with git:
```bash
cd $HOME
git clone https://github.com/rjsuzuki/linux_dotfiles.git ~/.dotfiles
source ~/.dotfiles/install.sh
```
#### custom installation with git:
```bash
cd $HOME
git clone https://github.com/rjsuzuki/linux_dotfiles.git ~/.dotfiles
```
Modify files as needed then run:
```bash
cd $HOME
sudo source $HOME/.dotfiles/install.sh
```

#### If you need to start over

- make sure to uninstall `oh-my-zsh` and/or delete the `$HOME/.oh-my-zsh` directory before trying again.
---
### Credits
🙏 Cheers to the [dotfile community](https:///dotfiles.github.io).
