# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Aliases
alias vim=nvim

# Theme
ZSH_THEME="maiksch"

# Plugins
plugins=(git zsh-autosuggestions)

# Automatically add ssh key to ssh-agent via keychain
eval $(keychain --eval --quiet ssh_ed25519)

source $ZSH/oh-my-zsh.sh
