# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
checkOS() {
  if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS='Cygwin'
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
}

checkOS

# ls
if [ "${OS}" == 'Linux' ]; then
  alias lla='ls -la'
elif [ "${OS}" == 'Mac' ]; then
  alias ls='ls -G'
  alias ll='ls -lG'
  alias lla='ls -laG'
fi

# bundle
alias bundle-install-first='bundle install --path vendor/bundle --binstubs .bundle/bin'
alias bi='bundle-install-first'

# docker
alias docker-rm-exited-all='docker rm $(docker ps -q -f status=exited)'
docker-exec-bash() { docker exec -it $1 /bin/bash; }
alias de='docker-exec-bash'

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

source ~/.modules/git/.git-completion.bash
source ~/.modules/git/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=

export PS1='[\u@\[\e[0;32m\]\h\[\e[00m\]:\[\e[0;33m\]\w\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[00m\]]\n\$ '

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
