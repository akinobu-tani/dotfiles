#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "terraform"; then
  echo "terraform: already installed"
  exit
fi

brew install terraform
if ! has "terraform"; then
    echo "error: terraform: failed to install"
    exit 1
fi

echo "terraform: installed successfully"
