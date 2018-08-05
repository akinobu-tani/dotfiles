#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "python3"; then
  echo "python3: already installed"
  exit
fi

brew install python
if ! has "python3"; then
    echo "error: python3: failed to install"
    exit 1
fi

echo "python3: installed successfully"
