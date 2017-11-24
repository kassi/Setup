#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

PListBuddy=/usr/libexec/PlistBuddy

IDETextKeyBindingSet=/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist
sudo $PlistBuddy -c "Add :Customized dict" $IDETextKeyBindingSet
sudo $PlistBuddy -c "Add ':Customized:Delete Line' string" $IDETextKeyBindingSet
sudo $PlistBuddy -c "Set ':Customized:Delete Line' 'moveToEndOfLine:, deleteToBeginningOfLine:, deleteToEndOfParagraph:'" $IDETextKeyBindingSet
sudo $PlistBuddy -c "Add ':Customized:Duplicate Line' string" $IDETextKeyBindingSet
sudo $PlistBuddy -c "Set ':Customized:Duplicate Line' 'selectLine:, deleteToEndOfParagraph:, yank:, moveToLeftEndOfLine:, yank:'" $IDETextKeyBindingSet

$PlistBuddy -c "Add ':ShortcutRecorder mainHotkey' dict" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Add ':ShortcutRecorder mainHotkey:keyCode' integer" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Set ':ShortcutRecorder mainHotkey:keyCode' 9" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Add ':ShortcutRecorder mainHotkey:modifierFlags' integer" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Set ':ShortcutRecorder mainHotkey:modifierFlags' 1572864" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Set ':loadOnStartup' true" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Set ':removeDuplicates' true" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Set ':savePreference' 2" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"
$PlistBuddy -c "Set ':skipPasswordFields' true" "$HOME/Library/Application Support/Flycut/com.generalarcade.flycut.plist"


