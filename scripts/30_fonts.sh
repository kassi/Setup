#!/usr/bin/env bash

DOWNLOAD_DIR=$HOME/Downloads

for url in \
  https://github.com/powerline/fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf \
  https://github.com/powerline/fonts/raw/master/AnonymousPro/Anonymice%20Powerline%20Bold.ttf \
  https://github.com/powerline/fonts/raw/master/AnonymousPro/Anonymice%20Powerline%20Italic.ttf \
  https://github.com/powerline/fonts/raw/master/AnonymousPro/Anonymice%20Powerline%20Bold%20Italic.ttf
do
  file=$(basename "$url")
  file=${file//\%20/ }
  wget -P $DOWNLOAD_DIR "$url"
  mv "$DOWNLOAD_DIR/$file" $HOME/Library/Fonts
done

