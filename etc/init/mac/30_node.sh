#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "node"; then
  echo "node: already installed"
  exit
fi

brew install node
if ! has "node"; then
    echo "error: node: failed to install"
    exit 1
fi

echo "node: installed successfully"
