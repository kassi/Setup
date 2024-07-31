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

pgrep -qf iTerm && { echo "ERROR: iTerm must not be running! Please restart command from standard Terminal."; exit 1; }

[[ -d $ICLOUD_SYSTEM_PATH ]] || mkdir $ICLOUD_SYSTEM_PATH
[[ -d $ICLOUD_SYSTEM_PATH/Sync ]] || mkdir $ICLOUD_SYSTEM_PATH/Sync

cp $SETUP_PATH/install.sh $ICLOUD_SYSTEM_PATH
mackup backup