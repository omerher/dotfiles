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

