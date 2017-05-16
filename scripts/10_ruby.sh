#!/usr/bin/env bash

# install rvm. ignore dotfiles because it's already been set up by ourselves
if [[ ! "$(type -P rvm)" ]]; then
  info "Installing RVM"
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
fi
