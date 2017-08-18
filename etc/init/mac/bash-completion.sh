#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if brewInstalled "bash-completion"; then
  echo "bash-completion: already installed"
  exit
fi

brew install bash-completion
if ! brewInstalled "bash-completion"; then
    echo "error: bash-completion: failed to install"
    exit 1
fi

echo "bash-completion: installed successfully"
