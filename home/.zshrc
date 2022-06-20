# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

ZSH_THEME="maiksch"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
