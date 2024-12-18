#.bashrc

# Source global bash rc
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/.bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/.bin:$HOME/bin:"
fi
export PATH

# Uncomment the following if you don't like systemctl's auto paging feature
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.dotfiles ]; then
  for rc in ~/.dotfiles/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc

[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

mkdir -p ~/.sandbox

source ~/.dotfiles/bash_alias
source ~/.dotfiles/bash_functions

PROMPT_COMMAND=set_prompt