#!/bin/bash
if [[ -d /Applications/Xcode.app ]]; then
  sudo xcodebuild -license accept

  PlistBuddy=/usr/libexec/PlistBuddy

  IDETextKeyBindingSet=/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist
  sudo $PlistBuddy -c "Add :Customized dict" $IDETextKeyBindingSet
  sudo $PlistBuddy -c "Add ':Customized:Delete Line' string" $IDETextKeyBindingSet
  sudo $PlistBuddy -c "Set ':Customized:Delete Line' 'moveToEndOfLine:, deleteToBeginningOfLine:, deleteToEndOfParagraph:'" $IDETextKeyBindingSet
  sudo $PlistBuddy -c "Add ':Customized:Duplicate Line' string" $IDETextKeyBindingSet
  sudo $PlistBuddy -c "Set ':Customized:Duplicate Line' 'selectLine:, deleteToEndOfParagraph:, yank:, moveToLeftEndOfLine:, yank:'" $IDETextKeyBindingSet
fi
