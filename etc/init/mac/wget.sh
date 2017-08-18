#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "wget"; then
  echo "wget: already installed"
  exit
fi

brew install wget
if ! has "wget"; then
    echo "error: wget: failed to install"
    exit 1
fi

echo "wget: installed successfully"
