#!/usr/bin/env bash

# Install perlbrew
if [[ ! "$(type -P perlbrew)" ]]; then
  info "Installing Perlbrew"
  curl -kL http://install.perlbrew.pl | PERLBREW_ROOT="$HOME/Library/Perl" bash
fi

source $HOME/.bashrc

if [[ ! "$(perlbrew list)" ]]; then
  perlbrew install $(perlbrew available | head -1)
fi
