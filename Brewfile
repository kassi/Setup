# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we're using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU utilities (without prefixes)
# Those that come with OS X are outdated
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils # --default-names
install findutils # --default-names

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
tap homebrew/dupes
# install homebrew/dupes/rsync

# Install more tools
install ack
install bash-completion
install ctags
install curl
install git hub
install gpg
install htop-osx
install imagemagick
install mysql
install node
install openssl
install phantomjs
install pstree
install python
install readline
install reattach-to-user-namespace
install tmux
install uncrustify
install watch
install wget
install xctool

# Install special dev related tools
install libidn
install libuv
install libyaml
# install erlang
# install ossp-uuid
# install redis
# install riak

# Remove outdated versions from the cellar
cleanup

# Check if installation is successfully
doctor
