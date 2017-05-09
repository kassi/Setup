#!/bin/bash

# install rvm. ignore dotfiles because it's already been set up by ourselves
\curl -sSL https://get.rvm.io | bash -s stable --ruby -- --ignore-dotfiles
