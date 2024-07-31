#!/bin/bash
# set -e # Exit immediately on error
# set -x # Print commands and their arguments as they are executed

if [[ -z $(which asdf) ]]; then exit; fi

asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add golang
asdf plugin-add lua
asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add ruby

# export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# local erlang_latest=$(asdf list-all erlang | grep -v rc | tail -1)
# asdf install erlang $erlang_latest
# asdf global erlang $erlang_latest

# local elixir_latest=$(asdf list-all elixir | grep -v rc | tail -1)
# asdf install elixir $elixir_latest
# asdf global elixir $elixir_latest

local golang_latest=$(asdf list-all golang | grep -v rc | tail -1)
asdf install golang $golang_latest
asdf global golang $golang_latest

local nodejs_latest=$(asdf list-all nodejs | tail -1)
asdf install nodejs $nodejs_latest
asdf global nodejs $nodejs_latest

local python_latest=$(asdf list-all python | grep ^3\. | grep -v dev | tail -1)
asdf install python $python_latest
asdf global python $python_latest

local ruby_latest=$(asdf list-all ruby | grep ^3\. | tail -1)
asdf install ruby $ruby_latest
asdf global ruby $ruby_latest

local direnv_latest=$(asdf list-all direnv | grep -v rc | tail -1)
asdf install direnv $direnv_latest
asdf global direnv $direnv_latest

asdf install lua 5.4.6 # Hammerspoon
asdf global lua 5.4.6
