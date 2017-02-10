# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
alias lla='ls -la'

source ~/etc/git/.git-completion.bash
source ~/etc/git/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=

PS1='[\u@\[\e[0;32m\]\h\[\e[00m\]:\[\e[0;33m\]\w\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[00m\]]\$ '
