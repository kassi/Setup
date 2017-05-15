#!/usr/bin/env bash

# Install perlbrew
curl -kL http://install.perlbrew.pl | PERLBREW_ROOT="$HOME/Library/Perl" bash
source $HOME/.bashrc
perlbrew install $(perlbrew available | head -1)

