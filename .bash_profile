# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH="./node_modules/.bin:$PATH"
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

export PATH

# BEGIN ANSIBLE RBENV BLOCK
if [ -d "$HOME/.rbenv" ]; then
  export RBENV_ROOT=$HOME/.rbenv
  export PATH=$RBENV_ROOT/bin:$PATH
  eval "$(rbenv init -)"
fi
# END ANSIBLE RBENV BLOCK

# BEGIN ANSIBLE NVM BLOCK
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi
# END ANSIBLE NVM BLOCK
