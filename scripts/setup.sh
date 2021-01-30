#!/usr/bin/env bash

DPATH=$HOME/.dotfiles

function main() {
  read -p "Install software? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    software
  fi

  read -p "Install managers? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    managers
  fi
  source $HOME/.asdf/asdf.sh

  read -p "Install langs? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    langs
  fi

  read -p "Install kitty? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    kitty
  fi
}

function managers() {
  echo "+-------------------------------+"
  echo "|        Installing asdf        |"
  echo "+-------------------------------+"
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
  cd $HOME/.asdf || exit
  git checkout "$(git describe --abbrev=0 --tags)"
  cd -- || exit
}

function kitty() {
  echo "+-------------------------------+"
  echo "|        Installing kitty       |"
  echo "+-------------------------------+"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
  ~/.local/share/applications/kitty.desktop
}

function langs() {
  echo "+---------------------------------+"
  echo "|        Installing NodeJS        |"
  echo "+---------------------------------+"
  asdf plugin-add nodejs
  bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs 15.0.0
  asdf global nodejs 15.0.0
  asdf plugin-add yarn
  asdf install yarn 1.21.1
  asdf global yarn 1.21.1

  echo "+-------------------------------+"
  echo "|        Installing Java        |"
  echo "+-------------------------------+"
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
  asdf install java adoptopenjdk-large_heap-8.0.265+1.openj9-0.21.0
  asdf global java adoptopenjdk-large_heap-8.0.265+1.openj9-0.21.0
  . ~/.asdf/plugins/java/set-java-home.zsh

  echo "+-------------------------------+"
  echo "|        Installing Ruby        |"
  echo "+-------------------------------+"
  asdf plugin-add ruby
  asdf install ruby 2.7.0
  asdf global ruby 2.7.0

  echo "+-------------------------------+"
  echo "|       Installing Python       |"
  echo "+-------------------------------+"
  asdf plugin-add python
  asdf install python 3.9.0
  asdf global python 3.9.0

  echo "+------------------------------+"
  echo "|        Installing Lua        |"
  echo "+------------------------------+"
  asdf plugin-add lua
  asdf install lua 5.3.5
  asdf global lua 5.3.5

  echo "+------------------------------+"
  echo "|       Installing Kotlin      |"
  echo "+------------------------------+"
  asdf plugin-add kotlin https://github.com/asdf-community/asdf-kotlin.git
  asdf install kotlin 1.4.0
  asdf global kotlin 1.4.0

  asdf reshim
}

function software() {
  echo "+-----------------------------------+" echo "|        Installing Software        |"
  echo "+-----------------------------------+"
  cp -f $DPATH/home/Library/Fonts/*.ttf $HOME/Library/Fonts

  echo "+-------------------------------+"
  echo "|        Installing Tmux        |"
  echo "+-------------------------------+"
  asdf plugin-add tmux
  asdf install tmux 3.1b
  asdf global tmux 3.1b
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "+---------------------------------+"
  echo "|        Installing NeoVim        |"
  echo "+---------------------------------+"
  gem install neovim solargraph
  pip install neovim pynvim
  pip3 install neovim python-language-server pylint pynvim
  yarn global add neovim write-good markdownlint-cli eslint prettier lua-fmt
}


main
