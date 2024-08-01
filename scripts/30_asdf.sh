#!/bin/bash
# set -e # Exit immediately on error
# set -x # Print commands and their arguments as they are executed

if [[ -z $(which asdf) ]]; then exit; fi

asdf plugin-add direnv
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add golang
asdf plugin-add lua
asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add ruby

# export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# erlang_latest=$(asdf list-all erlang | grep -v rc | tail -1)
# asdf install erlang $erlang_latest
# asdf global erlang $erlang_latest

# elixir_latest=$(asdf list-all elixir | grep -v rc | tail -1)
# asdf install elixir $elixir_latest
# asdf global elixir $elixir_latest

golang_latest=$(asdf list-all golang | grep -v rc | tail -1)
asdf install golang $golang_latest
asdf global golang $golang_latest

nodejs_latest=$(asdf list-all nodejs | tail -1)
asdf install nodejs $nodejs_latest
asdf global nodejs $nodejs_latest

brew ls --versions openssl@1.1 >/dev/null && brew uninstall openssl@1.1
python_latest=$(asdf list-all python | egrep "^[0-9\.]+$" | tail -1)
asdf install python $python_latest
asdf global python $python_latest

brew install openssl@1.1
ruby_latest=$(asdf list-all ruby | egrep "^[0-9\.]+$" | tail -1)
asdf install ruby $ruby_latest
asdf global ruby $ruby_latest

direnv_latest=$(asdf list-all direnv | grep -v rc | tail -1)
asdf install direnv $direnv_latest
asdf global direnv $direnv_latest
asdf direnv setup

# lua_latest=$(asdf list-all lua | egrep "^[0-9\.]+$" | tail -1)
# asdf install lua $lua_latest
# asdf global lua $lua_latest
