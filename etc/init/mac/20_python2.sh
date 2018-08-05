#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "python2"; then
  echo "python2: already installed"
  exit
fi

brew install python@2
if ! has "python2"; then
    echo "error: python2: failed to install"
    exit 1
fi

echo "python2: installed successfully"
