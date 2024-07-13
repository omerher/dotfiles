#!/bin/zsh
# WIP

# install tpm
if [[ ! -d ~/.tmux ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "[WARNING] tpm is already installed";
fi
