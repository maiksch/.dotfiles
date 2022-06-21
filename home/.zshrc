# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Theme
ZSH_THEME="maiksch"

# Plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
