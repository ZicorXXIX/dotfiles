#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

#aur vai kiski Query
read -p "avkQ: " query

if echo "$languages" | grep -qs "$selected"; then
    tmux split-window -v bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R"
else
    curl cht.sh/$selected~$query
fi


