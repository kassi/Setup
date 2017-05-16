#!/usr/bin/env bash

# install rvm. ignore dotfiles because it's already been set up by ourselves
if [[ ! "$(type -P rvm)" ]]; then
  info "Installing RVM"
  \curl -sSL https://get.rvm.io | bash -s stable -- --ignore-dotfiles
fi
