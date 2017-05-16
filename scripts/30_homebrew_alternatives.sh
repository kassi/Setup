# download from https://github.com/tekezo/Karabiner-Elements

if [[ ! -e /Applications/Karabiner-Elements.app ]]; then
  wget -P $HOME/Downloads https://pqrs.org/latest/karabiner-elements-latest.dmg
  open $HOME/Downloads/karabiner-elements-latest.dmg
  sleep 5
  open /Volumes/Karabiner-Elements*/*.pkg
fi
