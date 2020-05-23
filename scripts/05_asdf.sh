#!/bin/bash
# set -e # Exit immediately on error
# set -x # Print commands and their arguments as they are executed

if [[ -z $(which asdf) ]]; then exit; fi

asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add nodejs
asdf plugin-add python

export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
local erlang_latest=$(asdf list-all erlang | grep -v rc | tail -1)
asdf install erlang $erlang_latest
asdf global erlang $erlang_latest

local elixir_latest=$(asdf list-all elixir | grep -v rc | tail -1)
asdf install elixir $elixir_latest
asdf global elixir $elixir_latest

asdf install nodejs $(asdf list-all python | grep ^10\. | tail -1)
asdf install nodejs $(asdf list-all python | grep ^11\. | tail -1)
asdf global nodejs system

asdf install python $(asdf list-all python | grep ^2\. | grep -v dev | tail -1)
asdf install python $(asdf list-all python | grep ^3\. | grep -v dev | tail -1)
asdf global python system
