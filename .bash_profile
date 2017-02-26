# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
# BEGIN ANSIBLE RBENV BLOCK
if [ -d "$HOME/.rbenv" ]; then
  export RBENV_ROOT=$HOME/.rbenv
  export PATH=$RBENV_ROOT/bin:$PATH
  eval "$(rbenv init -)"
fi
# END ANSIBLE RBENV BLOCK
