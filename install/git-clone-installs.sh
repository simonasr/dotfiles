#!/bin/bash

# Kitty themes
sudo chown -R sirup ~/.config/
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

# goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# pip
pip3 install dotdrop/requirements.txt