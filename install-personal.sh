#!/bin/bash
set -euo pipefail
# set -e # Exit immediately on error
# set -u # Exit on undefined variables
# set -x # Print commands and their arguments as they are executed
# set -o pipefail # Exit on failures in piped commands.

SETUP_PATH=$(dirname $0)
DATA_PATH=$SETUP_PATH/data
SCRIPT_PATH=$SETUP_PATH/scripts
ICLOUD_PATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ICLOUD_SYSTEM_PATH=$ICLOUD_PATH/System

brew bundle --file=$DATA_PATH/Brewfile.personal
MACKUP_CONFIG_FILE=$DATA_PATH/mackup.personal.cfg mackup restore
