#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
DATA_PATH=$(dirname $SCRIPT_PATH)/data
DOTFILES=$(dirname $(dirname $SCRIPT_PATH))
OWN_PACKAGE_PATH="$HOME/Projects/Sublime Text"
APPSUPPORT_PATH="$HOME/Library/Application Support/Sublime Text 3"
APPSUPPORT_USERPATH="$APPSUPPORT_PATH/Packages/User"

# Check whether sublime text is installed
if [ ! -e /usr/local/bin/subl ]; then
  APP_STORE_PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
  if [[ -e $APP_STORE_PATH ]]; then
    ln -s "$APP_STORE_PATH" /usr/local/bin/subl
  else
    echo "Sublime Text seems not to be installed. Install it first!"
    exit 3
  fi
fi

# Quit Sublime Text 3
while [ -n "$(ps x | grep -v grep | grep 'Sublime Text.app')" ]; do
  echo "Sublime Text is running. Please quit before continuing. Press any key to continue: "
  read -n 1
done

echo "Installing Package Control"
curl -s http://sublime.wbond.net/Package%20Control.sublime-package -o "$APPSUPPORT_PATH/Installed Packages/Package Control.sublime-package"

if [[ ! -d "$DOTFILES/User" ]]; then
  echo "Cloning personal SublimeText User repository"
  cd "$DOTFILES"
  hub clone sublime-text-user User
fi

# Link to User repository inside Dotfiles
if [[ -d "$APPSUPPORT_USERPATH" && ! -L "$APPSUPPORT_USERPATH" ]]; then
  rmdir "$APPSUPPORT_USERPATH"
fi
if [[ -d "$APPSUPPORT_USERPATH" && -L "$APPSUPPORT_USERPATH" ]]; then
  rm "$APPSUPPORT_USERPATH"
elif [[ -d "$APPSUPPORT_USERPATH" ]]; then
  echo "$APPSUPPORT_USERPATH exists and is not empty. Make sure to backup files first"
  exit 1
fi
echo "Linking User"
ln -s "$DOTFILES/User" "$APPSUPPORT_USERPATH"

# temporarily disable color_scheme and theme since they have to be installed first
sed -e 's/\(\s*"color_scheme":.*\)/#&/' -e 's/\(\s*"theme":.*\)/#&/' -i- "$DOTFILES/User/Preferences.sublime-settings"

echo "Now let Sublime Text install all packages needed."
echo "You may want to watch the console (CTRL+CMD+C)."
echo "Quit Sublime Text once installation has finished."

# NOTE: I tried to add a show_console command and run subl --command show_console, but it didn't work.
subl

# reenable scheme and theme after required packages have been installed
cd "$DOTFILES/User"
git checkout Preferences.sublime-settings

# Add additional (old) packages from sources

cd "$APPSUPPORT_PATH/Packages"
for url in $(cat "$DATA_PATH/sublime-packages-additional.txt"); do
  dir=$(basename $url .git)
  if [[ ! -d $dir ]]; then
    git clone $url
  fi
done

# Add own packages from sources

mkdir -p "$OWN_PACKAGE_PATH"
cd "$OWN_PACKAGE_PATH"

for i in $(cat "$DATA_PATH/sublime-packages-own.txt"); do
  name=${i%=*}
  url=${i#*=}
  if [[ ! -d $name ]]; then
    git clone $url $name
    ln -s "$OWN_PACKAGE_PATH/$name" "$APPSUPPORT_PATH/Packages/$name"
  fi
done

# https://github.com/grych/subl-handler
