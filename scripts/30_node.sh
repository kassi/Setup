#!/usr/bin/env bash

# install node
nvm install 8.9.1

# install node packages
brew install yarn --without-node

npm install -g semistandard
