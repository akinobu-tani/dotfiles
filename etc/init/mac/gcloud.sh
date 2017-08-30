#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "gcloud"; then
  echo "gcloud: already installed"
  exit
fi

curl https://sdk.cloud.google.com | bash /dev/stdin --disable-prompts
if ! has "gcloud"; then
    echo "error: gcloud: failed to install"
    exit 1
fi

echo "gcloud: installed successfully"
