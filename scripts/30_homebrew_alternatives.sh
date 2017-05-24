# download from https://github.com/tekezo/Karabiner-Elements

if [[ ! -e /Applications/Karabiner-Elements.app ]]; then
  wget -P $HOME/Downloads https://pqrs.org/latest/karabiner-elements-latest.dmg
  open $HOME/Downloads/karabiner-elements-latest.dmg
  sleep 5
  open /Volumes/Karabiner-Elements*/*.pkg
fi

if [[ ! -d "$HOME/Library/Screen Savers/Aerial.saver" ]]; then
  path=$(curl -sL https://github.com/JohnCoates/Aerial/releases/latest | awk '{ if (match($0, /".*Aerial.zip"/)) print substr($0, RSTART+1, RLENGTH-2) }')
  (cd $HOME/Downloads && { curl -sLO https://github.com$path; unzip -q Aerial.zip; mv Aerial.saver "$HOME/Library/Screen Savers"; rm Aerial.zip; })
fi
