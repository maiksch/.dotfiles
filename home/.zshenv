export HOMEBREW="/opt/homebrew"
export VOLTA_HOME="$HOME/.volta"
export ZSH="$HOME/.oh-my-zsh"
export MASON="$HOME/.local/share/nvim/mason"

typeset -U PATH path

PATH="$HOME/.local/bin:$HOME/bin:$PATH:$HOMEBREW/bin:$VOLTA_HOME/bin:$MASON/bin:/usr/local/go/bin:$HOME/go/bin"

export PATH
