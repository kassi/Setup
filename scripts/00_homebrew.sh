#!/usr/bin/env bash
SCRIPT_PATH=$(dirname $(grealpath $0))

if [[ ! "$(type -P brew)" ]]; then
  info "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/bundle
brew bundle "$SCRIPT_PATH/../data/Brewfile"
