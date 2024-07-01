#!/bin/bash

if command -v nvim &> /dev/null; then
    exit
fi

sudo apt update
sudo chsh -s "$(which zsh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
