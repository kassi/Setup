#!/usr/bin/env bash

while [[ ! -d "$ICLOUD_PATH/System/Mackup" && ! -d "$ICLOUD_PATH/System/Sync" ]]; do
  echo "Make sure, iCloud has properly synced the following folders:"
  echo "  - System/Mackup"
  echo "  - System/Sync"
  read -p "Press ENTER when done" < /dev/tty
done

[[ -n $FORCE ]] || read -p "Press ENTER to restore mackup files" < /dev/tty
[[ -f $HOME/.mackup.cfg || -h $HOME/.mackup.cfg ]] && rm $HOME/.mackup.cfg
[[ -d $HOME/.mackup || -h $HOME/.mackup ]] && rm -rf $HOME/.mackup
ln -s $DATA_PATH/mackup.cfg $HOME/.mackup.cfg
ln -s $DATA_PATH/mackup $HOME/.mackup

oppose_running "Alfred" 1
oppose_running "Brave Browser"
oppose_running "Dash" 1
oppose_running "Flycut" 1
oppose_running "Hammerspoon" 1

open -a "Brave Browser" http://localhost
pkill -9 "Brave Browser"
cp "$ICLOUD_PATH/System/Sync/Brave/Preferences.init" "$HOME/Library/Application Support/BraveSoftware/Brave-Browser/Default/Preferences"

mackup $FORCE restore
