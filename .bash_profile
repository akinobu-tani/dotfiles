# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
PATH=$PATH:$HOME/bin.local

export PATH

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
