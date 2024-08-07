#!/bin/zsh
# WIP


# ---- OS specific ----
if [ "$(uname)" = "Darwin" ]; then # Mac OS X only
  os_name="MacOS"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then # Linux Only
  os_name="Linux"
fi


# ---- Install TPM and clone plugins ----
if [[ ! -d ~/.tmux ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "[INFO] tpm is already installed";
fi


# ---- oh-my-zsh plugins ----
download_oh_my_zsh_plugin () {
    repo_name=$1
    github_user="${2:-zsh-users}"

    if [[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$repo_name" ]]; then
        git clone "https://github.com/$github_user/$repo_name" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$repo_name"
    fi
}

download_oh_my_zsh_plugin zsh-autosuggestions
download_oh_my_zsh_plugin zsh-syntax-highlighting
download_oh_my_zsh_plugin zsh-completions
download_oh_my_zsh_plugin fzf-tab Aloxaf


# ---- Install packages
packages="jq fd lsd zoxide"
if [[ "$os_name" = "Linux" ]]; then
  install_command="sudo apt install"
elif [[ "$os_name" = "MacOS" ]]; then
  install_command="brew install"
fi

eval "$install_command $packages"

