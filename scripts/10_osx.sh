# copy services since they can't be linked
for service in $DATA_PATH/*.workflow; do
  service_name=$(basename "$service")
  echo "SERVICE: $service"
  echo "SERVICE: $service_name"
  if [ ! -d "$HOME/Library/Services/$service_name" ]; then
    cp -a "$service" "$HOME/Library/Services/"
  fi
done

# set system defaults

# Dock
defaults write com.apple.Dock tilesize -integer 58

# Active corners: top right enabled screen saver
# Possible values:
#  0: no-op
#  2: Mission Control (all windows)
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
#
# Top right corner: screen saver, nothing else
defaults write com.apple.Dock wvous-tr-corner -int 5
defaults write com.apple.Dock wvous-tr-modifier -int 0
defaults write com.apple.Dock wvous-tl-corner -int 0
defaults write com.apple.Dock wvous-br-corner -int 0
defaults write com.apple.Dock wvous-bl-corner -int 0
#
killall Dock

# Keyboard
defaults write NSGlobalDomain com.apple.keyboard.fnState -int 1
# Tab keys goes through all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
# Disable quote substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -int 0
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -int 0
# Remap Focus to next window to CMD-^
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "{enabled = 0; value = { parameters = (65535, 10, 1048576); type = 'standard'; }; }"
# Disable Show/Hide Dock
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 52 "{enabled = 0; value = { parameters = (100, 2, 1572864); type = 'standard'; }; }"

# App Shortcuts
# I'm used to hit CMD-Ö/CMD-Ä on a german keyboard
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "N\\U00e4chsten Tab ausw\\U00e4hlen" "@\\U00e4"
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Vorherigen Tab ausw\\U00e4hlen" "@\\U00f6"
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "N\\U00e4chsten Tab anzeigen" "@\\U00e4"
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "Vorherigen Tab anzeigen" "@\\U00f6"
defaults write com.apple.Terminal NSUserKeyEquivalents -dict-add "N\\U00e4chsten Tab ausw\\U00e4hlen" "@\\U00e4"
defaults write com.apple.Terminal NSUserKeyEquivalents -dict-add "Vorherigen Tab ausw\\U00e4hlen" "@\\U00f6"
defaults write com.cisco.Jabber NSUserKeyEquivalents -dict-add "N\\U00e4chste Registerkarte ausw\\U00e4hlen" "@\\U00e4"
defaults write com.cisco.Jabber NSUserKeyEquivalents -dict-add "Vorherige Registerkarte ausw\\U00e4hlen" "@\\U00f6"
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Zoom" "@~m"
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Zoomen" "@~m"

# Mouse
defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Activate Scroll Zoom with Control key and mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144
defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Safari
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -int 1
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -int 1
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -int 1


# Add Terminal Settings - run the terminal installer first
defaults write com.apple.Terminal "Default Window Settings" Monokai
defaults write com.apple.Terminal "Startup Window Settings" Monokai

# disable ip v6 - gpg doesn't find keyserver with it
# set +o pipefail
# networksetup -listallnetworkservices | grep Ethernet && networksetup -setv6off Ethernet
# set -o pipefail
# networksetup -setv6off Wi-Fi
