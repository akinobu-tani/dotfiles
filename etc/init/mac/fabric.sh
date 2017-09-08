#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "fab"; then
  echo "fabric: already installed"
  exit
fi

pip2 install fabric
if ! has "fab"; then
    echo "error: fabric: failed to install"
    exit 1
fi

echo "fabric: installed successfully"
