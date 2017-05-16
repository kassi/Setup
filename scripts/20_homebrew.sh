#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

brew bundle --path
brew bundle --path=$(dirname $SCRIPT_PATH)/data/Brewfile_20