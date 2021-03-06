#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

if [[ ! "$(type -P brew)" ]]; then
  info "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew analytics off
brew tap Homebrew/bundle
brew bundle --file=$(dirname $SCRIPT_PATH)/data/Brewfile_00
