#!/bin/zsh
# WIP

# create backups of all configs
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
    echo $full_path
    mv $full_path "$full_path.bck"
  fi
done


# install tpm
if [[ ! -d ~/.tmux ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "[INFO] tpm is already installed";
fi
