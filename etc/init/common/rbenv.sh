#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -e

. ${HOME}/dotfiles/etc/include.sh

if has "rbenv"; then
  echo "rbenv already seems installed"

  rbenv_dir="$(rbenv root)"

  if [ -d "${rbenv_dir}/.git" ]; then
    echo "Trying to update rbenv"
    cd "${rbenv_dir}"
    git pull --tags origin master
  fi
else
  echo "Installing rbenv"

  rbenv_dir=~/.rbenv
  git clone https://github.com/rbenv/rbenv.git "${rbenv_dir}"
fi

ruby_build_dir="${rbenv_dir}/plugins/ruby-build"
if [ -d "${ruby_build_dir}" ]; then
  echo "'rbenv install' command already available"

  if [ -d "${ruby_build_dir}/.git" ]; then
    echo "Trying to update ruby-build"
    cd "${ruby_build_dir}"
    git pull --tags origin master
  fi
else
  echo "Installing ruby-build"
  mkdir -p "${rbenv_dir}/plugins"
  git clone https://github.com/rbenv/ruby-build.git "${rbenv_dir}/plugins/ruby-build"
fi

rbenv_binstubs_dir="${rbenv_dir}/plugins/rbenv-binstubs"
if [ -d "${rbenv_binstubs_dir}" ]; then
  echo "rbenv binstubs already installed"

  if [ -d "${rbenv_binstubs_dir}/.git" ]; then
    echo "Trying to update rbenv-binstubs"
    cd "${rbenv_binstubs_dir}"
    git pull --tags origin master
  fi
else
  echo "Installing rbenv-binstubs"
  git clone https://github.com/ianheggie/rbenv-binstubs.git "${rbenv_dir}/plugins/rbenv-binstubs"
fi

. ${DOT_DIRECTORY}/.bash_profile

if ! has "rbenv"; then
    echo "rbenv: brew: failed to install"
    exit 1
fi

echo "rbenv: installed successfully"
