#!/bin/bash

# Qt 5.5 is needed for capybara-webkit
# but qt@5.5 has been removed from brew

cd /tmp
git clone https://github.com/Eric-Guo/homebrew-qt55
sed '/depends_on :macos/d' < Formula/qt@5.5.rb > /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/qt@5.5.rb
brew install qt@5.5
