#!/bin/bash
# Pasiskolinta is https://github.com/japorized/dotfiles/tree/master/install

# Ensure user has edited config.yaml and the dotfiles for proper installation
echo "Please edit config.yaml for your machine before proceeding. Is that step complete?"
read response

if [ $response != "yes" ]; then
  echo 'Please make those changes before running this script again to ensure that everything runs smoothly.'
  exit 0
fi

echo 'Installing xcode cli tools'
/usr/bin/xcode-select --install

# Creating directory for config files
# Note that this is important since macOS does not generate one
# by itself
# CONFIG=$HOME/.config

# if [ -d $CONFIG ]; then
#   echo "Creating $CONFIG"
#   mkdir -p ~/.config/vim ~/.config/mpd ~/.config/ncmpcpp ~/.config/w3m
# fi

echo 'Installing Homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/simonas.rupsys/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Installing Homebrew packages'
. $HOME/dotfiles/install/brew-install.sh

echo 'Installing gems'
. $HOME/dotfiles/install/gem-install.sh

echo 'Git clone stuff'
. $HOME/dotfiles/install/git-clone-installs.sh
