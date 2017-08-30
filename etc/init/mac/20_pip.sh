#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "pip"; then
  echo "pip: already installed"
  exit
fi

python get-pip.py
if ! has "pip"; then
    echo "error: pip: failed to install"
    exit 1
fi

echo "pip: installed successfully"
