#!/bin/bash

figlet -c DevTools


#--------------------------------------------
# Atom.io - https://atom.io/download/deb
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing Atom text editor..."
echo "-------------------------------------------"
if [ $1 == 1 ]; then
  sudo snap install atom --classic
then
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt update
  sudo apt install atom -y
fi
echo "atom done!"

#--------------------------------------------
# java 8 sdk
#--------------------------------------------
echo "-------------------------------------------"
echo "Installing Java JDK..."
echo "-------------------------------------------"
sudo apt install openjdk-8-jdk -y

#sudo apt install -y software-properties-common
#sudo add-apt-repository ppa:webupteam/java
#sudo apt install oracle-java8-installer -y
#sudo apt install oracle-java8-set-default -y
# must set JAVA_HOME environment variable to location of JDK
echo "java done!"

#--------------------------------------------
# IDEs
#--------------------------------------------
if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing Idea..."
  echo "-------------------------------------------"
  sudo snap install intellij-idea-community --classic
  echo "intellij-idea-community done!"
fi

if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing Android Studio..."
  echo "-------------------------------------------"
  sudo snap install android-studio --classic
  echo "android-studio done!"
fi

if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing Slack..."
  echo "-------------------------------------------"
  sudo snap install slack --classic
  echo "Slack done!"
fi

if [ $1 == 1 ]; then
  echo "-------------------------------------------"
  echo "Installing CircleCI local cli..."
  echo "-------------------------------------------"
  sudo snap install circleci
  echo "circleci done!"
fi
