#!/bin/sh

# brew taps
brew tap phinze/cask
brew tap caskroom/cask
brew tap d12frosted/emacs-plus

# brew installations
brew install awk
brew install coreutils
brew install git
brew install htop
brew install nmap
brew install thefuck
brew install screen
# brew install vim
brew install wget
brew install zsh
brew install pure
brew install fzf
brew install shellcheck
brew install imagemagick
brew install openssl
brew cask install kitty
brew install hammerspoon
brew install karabiner-elements
brew install tree
brew install pyenv

# Boost fzf
/usr/local/opt/fzf/install --key-bindings --completion --update-rc --no-fish

# nvim
brew install neovim
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Firacode fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# MacLaunch
brew install hazcod/homebrew-hazcod/maclaunch

# Docker & Docker-compose
brew install docker
brew install docker-compose

