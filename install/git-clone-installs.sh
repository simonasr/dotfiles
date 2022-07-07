#!/bin/bash

sudo chown -R sirup ~/.config/
sudo chown -R sirup ~/.local/share

# Kitty themes
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

# goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# pip
pip3 install -r dotdrop/requirements.txt