#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "docker"; then
  echo "docker: already installed"
  exit
fi

download_url=https://download.docker.com/mac/stable/Docker.dmg
dmg_file=${download_url##*/}
curl -LO $download_url
mount_dir=`hdiutil attach $dmg_file | awk -F '\t' 'END{print $NF}'`
sudo /usr/bin/ditto "$mount_dir/Docker.app" "/Applications/Docker.app"
hdiutil detach "$mount_dir"
rm $dmg_file

if ! has "docker"; then
    echo "error: docker: failed to install"
    exit 1
fi

# install bash completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion /usr/local/etc/bash_completion.d/docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion /usr/local/etc/bash_completion.d/docker-machine
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion /usr/local/etc/bash_completion.d/docker-compose

echo "docker: installed successfully"
