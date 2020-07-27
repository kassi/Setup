#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

if [[ -d $HOME/Documents/Fritzing ]]; then
  ln -s $HOME/Documents/Fritzing $HOME/Fritzing
fi
