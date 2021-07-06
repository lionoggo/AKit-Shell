#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2155,SC2086
#===============================================================
# import="$(basename "${BASH_SOURCE[0]}" .sh)_$$"
# if [[ $(eval echo '$'"${import}") == 0 ]]; then return; fi
# eval "${import}=0"
#===============================================================

oldifs="$IFS"
IFS=$'\n'

file_paths=($(find /Users/lionoggo/Workspace/Tool/ ! -path "*/cache/*" ! -path "*/akit-nvim/*" ! -path "*/Flutter/*" ! -path "*/intellij-community/*"  -type f -path "*git/config"))

echo "-->"
for file in ${file_paths[@]}; do
    git_url= echo $file| xargs grep -ri "url" | cut -d '=' -f2 | sed 's/^[ \t]*//g'
    echo "$git_url"
done
IFS="$oldifs" # 别忘了把IFS改回去
# find . ! -path "*/cache/*" ! -path "*/akit-nvim/*" ! -path "*/Flutter/*" ! -path "*/intellij-community/*"  -type f -path "*git/config" | xargs grep -ri "url" | cut -d '=' -f2 | sed 's/^[ \t]*//g'
