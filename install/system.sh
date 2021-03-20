#!/bin/bash

figlet -c SysTools

#--------------------------------------------
# Extras
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing virtualbox"
echo "-------------------------------------------"
sudo apt install virtualbox -y
echo "virtualbox done!"

if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing htop"
  echo "-------------------------------------------"
  #sudo apt-get install htop
  sudo snap install htop
  echo "htop done!"
  #sudo snap connect htop:hardware-observe  # temperature+battery status
  #sudo snap connect htop:mount-observe
  #sudo snap connect htop:network-control  # DELAYACCT

  echo "-------------------------------------------"
  echo "Installing glances"
  echo "-------------------------------------------"
  sudo snap install glances
  echo "glances done!"
fi
