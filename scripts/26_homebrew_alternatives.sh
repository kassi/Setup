# download from https://github.com/tekezo/Karabiner-Elements

if [[ ! -e /Library/Mail/Bundles/GPGMail.mailbundle ]]; then
  wget -P $HOME/Downloads https://releases.gpgtools.org/GPG_Suite-2017.1b3-v2.dmg
  open $HOME/Downloads/GPG_Suite-2017.1b3-v2.dmg
  while [[ ! -f "/Volumes/GPG Suite/Install.pkg" ]]; do sleep 1; done
  open "/Volumes/GPG Suite/Install.pkg"
fi

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

# if [[ ! -f "$HOME/bin/stripcmt" ]]; then
#   path=$(curl http://www.bdc.cx/software/stripcmt/ | grep "/download" | cut -d '"' -f 2)
#   wget -P $HOME/Downloads http://www.bdc.cx$path
#   cd $HOME/Downloads
#   file=basename $path
#   dir=basename $path .tar.gz
#   tar xfz $file
#   cd $dir
#   make
#   cp stripcmt "$HOME/bin"
# fi
