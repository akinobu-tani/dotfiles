#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "ansible"; then
  echo "ansible: already installed"
  exit
fi

pip2 install ansible
if ! has "ansible"; then
    echo "error: ansible: failed to install"
    exit 1
fi

echo "ansible: installed successfully"
