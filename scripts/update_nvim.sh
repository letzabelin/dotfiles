#!/bin/bash
cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim.git
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
