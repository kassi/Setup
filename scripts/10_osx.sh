#!/usr/bin/env bash
# set system defaults

# Dock
defaults write com.apple.Dock tilesize -integer 48
# Active corners: top right enabled screen saver
defaults write com.apple.Dock wvous-tr-corner -int 5
defaults write com.apple.Dock wvous-tr-modifier -int 0
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
defaults write com.apple.Chrome NSUserKeyEquivalents -dict-add "N\\U00e4chsten Tab ausw\\U00e4hlen" "@\\U00e4"
defaults write com.apple.Chrome NSUserKeyEquivalents -dict-add "Vorherigen Tab ausw\\U00e4hlen" "@\\U00f6"
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "N\\U00e4chsten Tab anzeigen" "@\\U00e4"
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add "Vorherigen Tab anzeigen" "@\\U00f6"
defaults write com.apple.Terminal NSUserKeyEquivalents -dict-add "N\\U00e4chsten Tab ausw\\U00e4hlen" "@\\U00e4"
defaults write com.apple.Terminal NSUserKeyEquivalents -dict-add "Vorherigen Tab ausw\\U00e4hlen" "@\\U00f6"
defaults write com.cisco.Jabber NSUserKeyEquivalents -dict-add "N\\U00e4chste Registerkarte ausw\\U00e4hlen" "@\\U00e4"
defaults write com.cisco.Jabber NSUserKeyEquivalents -dict-add "Vorherige Registerkarte ausw\\U00e4hlen" "@\\U00f6"

# Mouse
defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Safari
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -int 1
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -int 1
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -int 1


# Add Terminal Settings - run the terminal installer first
defaults write com.apple.Terminal "Default Window Settings" Monokai
defaults write com.apple.Terminal "Startup Window Settings" Monokai

# Show images and names in group chats
# defaults write com.apple.iChat SOTranscriptSettingsDefaultGroupChatSettingsPreferences -dict-add participantDisplay -int 2
# defaults write com.apple.iChat SOTranscriptSettingsDefaultGroupChatSettingsPreferences -dict-add transcriptStyleID "com.apple.iChat.Styles.Boxes"

IDETextKeyBindingSet=/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist
sudo /usr/libexec/PlistBuddy -c "Add :Customized dict" $IDETextKeyBindingSet
sudo /usr/libexec/PlistBuddy -c "Add ':Customized:Delete Line' string" $IDETextKeyBindingSet
sudo /usr/libexec/PlistBuddy -c "Set ':Customized:Delete Line' 'moveToEndOfLine:, deleteToBeginningOfLine:, deleteToEndOfParagraph:'" $IDETextKeyBindingSet
sudo /usr/libexec/PlistBuddy -c "Add ':Customized:Duplicate Line' string" $IDETextKeyBindingSet
sudo /usr/libexec/PlistBuddy -c "Set ':Customized:Duplicate Line' 'selectLine:, deleteToEndOfParagraph:, yank:, moveToLeftEndOfLine:, yank:'" $IDETextKeyBindingSet

