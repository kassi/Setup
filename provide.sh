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
ICLOUD_SYSTEM_PATH="$ICLOUD_PATH/System"

oppose_running() {
  while pgrep -qf "$1"; do
    if [[ $1 == iTerm && $TERM_PROGRAM == "iTerm.app" ]]; then
      echo "ERROR: $1 must not be running! Please restart command from standard Terminal."
      exit 1
    fi
    if [[ -n ${2-} ]]; then
      pkill -9 "$1"
    else
      read -p "ERROR: $1 must not be running! Press ENTER to continue" < /dev/tty
    fi
  done
}

# oppose_running "iTerm"
# oppose_running "Alfred" 1
# oppose_running "Brave Browser"
# oppose_running "Dash" 1
# oppose_running "Flycut" 1
# oppose_running "Hammerspoon" 1

[[ -d "$ICLOUD_SYSTEM_PATH" ]] || mkdir "$ICLOUD_SYSTEM_PATH"
[[ -d "$ICLOUD_SYSTEM_PATH/Sync" ]] || mkdir "$ICLOUD_SYSTEM_PATH/Sync"

cp $SETUP_PATH/install.sh "$ICLOUD_SYSTEM_PATH"

[[ -d "$ICLOUD_SYSTEM_PATH/Sync/Brave" ]] || mkdir "$ICLOUD_SYSTEM_PATH/Sync/Brave"
jq '{extensions: .extensions}' "$HOME/Library/Application Support/BraveSoftware/Brave-Browser/Default/Preferences" > "$ICLOUD_SYSTEM_PATH/Sync/Brave/Preferences.init"

# Dash preferences can't be symlinked.
cp $HOME/Library/Preferences/com.kapeli.dashdoc.plist "$ICLOUD_SYSTEM_PATH/Sync"

mackup backup
