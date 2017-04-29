#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "brew"; then
  echo "brew: already installed"
  exit
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if has "brew"; then
    brew doctor
else
    echo "error: brew: failed to install"
    exit 1
fi

echo "brew: installed successfully"
