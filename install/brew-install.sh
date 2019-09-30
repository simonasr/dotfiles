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
brew install python
brew install python3
brew install thefuck
brew install screen
# brew install vim
brew install wget
brew install zsh
brew install fzf
brew install shellcheck
brew install imagemagick
brew install openssl

# brew casks installations
# brew cask install amm
# brew cask install betterzipql
# brew cask install google-chrome
# brew cask install hammerspoon
# brew cask install handbrake
# brew cask install knockknock
# brew cask install lastfm
# brew cask install love
# brew cask install pomolectron
# brew cask install skim
# brew cask install spotify
brew cask install vlc
# brew cask install xquartz
brew cask install kitty
brew install tree

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
