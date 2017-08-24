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
  alias la='ls -laG'
fi

alias tn='tail -n 1000'

# bundle
alias bundle-install-first='bundle install --path vendor/bundle --binstubs .bundle/bin'
alias bi='bundle-install-first'

# docker
alias docker-rm-exited-all='docker rm $(docker ps -f status=exited -f status=created -f status=dead -f status=paused -q)'
docker-exec-bash() { docker exec -it $1 /bin/bash; }
alias d='docker'
alias de='docker-exec-bash'
alias dp='docker ps'
alias da='docker ps -a'
alias ds='docker stats --no-stream $(docker ps --format={{.Names}})'
alias dst='docker stats $(docker ps --format={{.Names}})'
alias dss='docker-sync start'
alias dsc='docker-sync clean'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcp='docker-compose ps'
docker-compose-exec-bash() { docker-compose exec $1 /bin/bash; }
alias dcb='docker-compose-exec-bash'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias docker-ssh-agent-start='docker run -u 1001 -d -v ssh:/ssh --name=ssh-agent whilp/ssh-agent'
alias docker-ssh-add='docker run -u 1001 --rm -v ssh:/ssh -v $HOME:$HOME -it whilp/ssh-agent ssh-add'

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
