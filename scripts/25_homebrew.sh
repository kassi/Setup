#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

brew bundle --file=$(dirname $SCRIPT_PATH)/data/Brewfile_25
