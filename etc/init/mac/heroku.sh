#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "heroku"; then
  echo "heroku: already installed"
  exit
fi

brew install heroku/brew/heroku
if ! has "heroku"; then
    echo "error: heroku: failed to install"
    exit 1
fi

echo "heroku: installed successfully"
