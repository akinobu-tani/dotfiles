#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "docker-sync"; then
  echo "docker-sync: already installed"
  exit
fi

sudo gem install docker-sync
if ! has "docker-sync"; then
    echo "error: docker-sync: failed to install"
    exit 1
fi

echo "docker-sync: installed successfully"