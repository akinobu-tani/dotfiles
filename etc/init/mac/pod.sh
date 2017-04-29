#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "pod"; then
  echo "pod: already installed"
  exit
fi

sudo gem install cocoapods
if ! has "pod"; then
    echo "error: pod: failed to install"
    exit 1
fi

echo "pod: installed successfully"
