# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
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

PATH="./node_modules/.bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then
  source "$HOME/google-cloud-sdk/path.bash.inc"
fi

if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.bash.inc"
fi

# increase the number of open files
ulimit -S -n 1024
