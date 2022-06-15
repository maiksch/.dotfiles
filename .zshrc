# Created by newuser for 5.8.1

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH=$PATH:/usr/local/bin/go/bin

eval "$(oh-my-posh init zsh --config /home/maik/.dotfiles/oh-my-posh/maiksch.omp.json)"
