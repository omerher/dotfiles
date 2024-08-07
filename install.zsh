#!/bin/zsh
# WIP


# ---- OS specific ----
if [ "$(uname)" = "Darwin" ]; then # Mac OS X only
  os_name="MacOS"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then # Linux Only
  os_name="Linux"
fi


# ---- Create backups of all configs ----
# TODO - change this to use .stow-ignore-files
FOLDERS_TO_EXCLUDE=".git sources"
FILES_TO_EXCLUDE="README.md install.zsh"

# Convert space-separated lists into arrays
folders_array=(${=FOLDERS_TO_EXCLUDE})
files_array=(${=FILES_TO_EXCLUDE})

# Construct the find command with exclusion parameters
find_command="find . -type f"
for folder in "${folders_array[@]}"; do
    find_command+=" -not -path \"./$folder/*\""
done
for file in "${files_array[@]}"; do
    find_command+=" -not -name \"$file\""
done

eval $find_command | while read file; do
  full_path="$HOME/${file#./}"
  if [[ -f "$full_path" ]]; then
    backup_path="$full_path.bck"
    if [[ -f "$backup_path" ]]; then
      temp_path="/tmp/$(basename $backup_path).$(openssl rand -hex 3)"
      cp "$backup_path $temp_path"
      echo "[INFO] existing backup file for $backup_path found, copying to $temp_path"
    fi
    mv $full_path "$full_path.bck"
  fi
done


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

