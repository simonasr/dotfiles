#!/usr/bin/env bash

################################################################################
# bootstrap
#
# This script is intended to set up Bootstrap linux configuration   
#
# Much of this script was derived from: 
# https://raw.githubusercontent.com/joshukraine/linux-bootstrap/master/bootstrap
################################################################################


# Thank you, thoughtbot! :)
bootstrap_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n[BOOTSTRAP] $fmt\n" "$@"
}


################################################################################
# Variable declarations
################################################################################

osname=$(uname)

################################################################################
# Make sure we're on Linux before continuing
################################################################################

if [[ "$osname" == 'Darwin' ]]; then
  bootstrap_echo "Oops, looks like you're on a Mac. Please check out the link
below for instructions on setting up macOS."
  bootstrap_echo "http://jsua.co/macos"
  exit 1
elif [[ "$osname" != 'Linux' ]]; then
  bootstrap_echo "Oops, it looks like you're using a non-supported OS. Exiting..."
  exit 1
fi


################################################################################
# 1. Update the system.
################################################################################

bootstrap_echo "Step 1: Updating system packages ..."

sudo apt update
sudo apt -y upgrade


################################################################################
# 2. Install basic tools
################################################################################

bootstrap_echo "Step 2: Installing basic tools..."

bootstrap_echo "Installing build-essential..."
sudo apt install -y build-essential

bootstrap_echo "Installing curl ..."
sudo apt install -y curl

bootstrap_echo "Installing neovim ..."
sudo apt remove vim-tiny -y
sudo apt install -y neovim

bootstrap_echo "Installing htop..."
sudo apt install -y htop

bootstrap_echo "Installing tree..."
sudo apt install -y tree

bootstrap_echo "Installing zsh..."
sudo apt install -y zsh

bootstrap_echo "Installing other stuff..."
sudo apt install -y snap unzip python3-pip

################################################################################
# 3. Install oh-my-zsh
################################################################################

bootstrap_echo "Step 3: Installing oh-my-zsh..."

if [ -d "$HOME"/.oh-my-zsh ]; then
  rm -rf "$HOME"/.oh-my-zsh
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

bootstrap_echo "Changing your shell to zsh ..."

chsh -s "$(which zsh)"


################################################################################
# 4. Setup dotfiles
################################################################################

# git submodule add https://github.com/deadc0de6/dotdrop.git
git submodule update --init --recursive
pip3 install -r dotdrop/requirements.txt --user
./dotdrop/bootstrap.sh


################################################################################
# 6. Install Powerline-patched fonts
################################################################################

bootstrap_echo "Step 6: Installing fixed-width fonts patched for use with Powerline symbols..."

if [ -d "$HOME"/src/fonts ]; then
  rm -rf "$HOME"/src/fonts
fi

git clone https://github.com/powerline/fonts.git "$HOME"/src/fonts

cd "$HOME"/src/fonts || exit

./install.sh

cd "$HOME" || exit

rm -rf "$HOME"/src/fonts




bootstrap_echo "Done!"

echo ""
echo "******************************************************************"
echo "**** Bootstrap script complete! Please restart your computer. ****"
echo "******************************************************************"
echo ""
