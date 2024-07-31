if ! command -v brew &> /dev/null; then
  read -p "Press ENTER to install homebrew" < /dev/tty
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

read -p "Press ENTER to brew" < /dev/tty
brew analytics off
brew bundle --file=$DATA_PATH/Brewfile
