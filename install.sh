#!/bin/bash
set -euo pipefail
# set -e # Exit immediately on error
# set -u # Exit on undefined variables
# set -x # Print commands and their arguments as they are executed
# set -o pipefail # Exit on failures in piped commands.

echo "Setting up your Mac"

DESTINATION_PATH=$HOME/System/Setup
DATA_PATH=$DESTINATION_PATH/data
SCRIPT_PATH=$DESTINATION_PATH/scripts
ICLOUD_PATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

pgrep -qf iTerm && { echo "ERROR: iTerm must not be running! Please restart command from standard Terminal."; exit 1; }

# Need a valid ssh key to clone
ssh_private_key=
if [[ -e $HOME/.ssh/id_ed25519 ]]; then
  ssh_private_key=$HOME/.ssh/id_ed25519
elif [[ -e $HOME/.ssh/id_rsa ]]; then
  ssh_private_key=$HOME/.ssh/id_rsa
else
  echo "No ssh key found."
  read -p "Press ENTER to create a new one or CTRL-C to cancel and copy an existing one in place" < /dev/tty
  ssh-keygen -b 4096
  ssh_private_key=$(ls -1 $HOME/.ssh/id_* | grep -v .pub | head -1)
  cat $ssh_private_key.pub | pbcopy
  echo "Now create a new key in Github and paste the copied public key"
  open "https://github.com/settings/ssh/new"
  read -p "Press ENTER when done" < /dev/tty
fi

if [[ ! -d $DESTINATION_PATH ]]; then
  read -p "Press ENTER to clone repo" < /dev/tty
  echo "Cloning into $DESTINATION_PATH."
  git clone git@github.com:kassi/Setup $DESTINATION_PATH
fi

for file in $SCRIPT_PATH/*.sh; do
  read -p "Press ENTER to run " $(basename $file) < /dev/tty
  source $file
fi

echo Done
