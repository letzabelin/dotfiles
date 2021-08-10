#!/usr/bin/env bash

main() {
  # adding global gitignore
  git config --global core.excludesfile ~/.gitignore

  # unique path
  typeset -U path
}

main
