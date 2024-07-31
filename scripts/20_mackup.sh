#!/usr/bin/env bash

while [[ ! -d "$ICLOUD_PATH/System/Mackup" && ! -d "$ICLOUD_PATH/System/Sync" ]]; do
  echo "Make sure, iCloud has properly synced the following folders:"
  echo "  - System/Mackup"
  echo "  - System/Sync"
  read -p "Press ENTER when done" < /dev/tty
done

read -p "Press ENTER to restore mackup files" < /dev/tty
ln -s $DATA_PATH/mackup.cfg $HOME/.mackup.cfg
ln -s $DATA_PATH/mackup $HOME/.mackup
mackup restore
