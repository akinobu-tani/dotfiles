#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "carthage"; then
  echo "carthage: already installed"
  exit
fi

brew install carthage
if ! has "carthage"; then
    echo "error: carthage: failed to install"
    exit 1
fi

echo "carthage: installed successfully"
