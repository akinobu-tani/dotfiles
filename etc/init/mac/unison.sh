#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "unison"; then
  echo "unison: already installed"
  exit
fi

brew install unison
if ! has "unison"; then
    echo "error: unison: failed to install"
    exit 1
fi

echo "unison: installed successfully"
