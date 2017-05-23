# System Setup

My personal machine setup, optimized for an osx development machine.

## Installation

Recommendation: First install git@github.com:kassi/Dotfiles.git. Then

  dotfiles --repo kassi/Setup

Otherwise (clean install, not recommended)

  curl -fsSL https://raw.github.com/kassi/Dotfiles/master/links/bin/dotfiles | bash -s -- --repo git@github.com:kassi/Dotfiles.git

## Documentation

On an `install` or `update`

* any directory in `directories` will be created, even nested
* any item in `links` will be processed as follows
    * files will be linked to $HOME
    * directories will checked whether they already exist.
        * If they do, next item is processed
        * If they are linked (already), they will be skipped
        * Otherwise the directory will be linked
    * During processing paths are processed in sequence
* any shell script in `scripts` is run

See https://github.com/kassi/Dotfiles for details.

## Author

Karsten Silkenbäumer
