#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

# Ask for the administrator password upfront
sudo -v

for i in "${DOT_DIRECTORY}"/etc/init/"${OS}"/*.sh
do
    if [ -f "$i" ]; then
        echo "-> "$(basename "$i")""
        bash "$i"
    else
        continue
    fi
done
