#!/usr/bin/env bash

# Save this file as ~/scripts/tmux-sessionizer
# Make it executable with: chmod +x ~/.local/bin/tmux-sessionizer

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd -H . ~/dotfiles ~/Desktop/main-cs ~/Desktop/main-cs/Projects ~/ ~/Desktop/work ~/Desktop/work/youtube -t d -d 1 | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
