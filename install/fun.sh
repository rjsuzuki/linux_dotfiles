#!/bin/bash

figlet -c FunStuff

if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing Spotify..."
  echo "-------------------------------------------"
  snap install spotify
  echo "Spotify done!"

  echo "-------------------------------------------"
  echo "Installing QR Code Generator..."
  echo "-------------------------------------------"
  sudo snap install qr-code-generator-desktop
  echo "QR Code Generator done!"
fi
