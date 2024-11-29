#!/bin/bash

# Script to find every single file and opens in neovim
# alias set as nzo in .zshrc
search_with_zoxdie() {
    if [ -z "$1" ]; then
        # use fd with fzf to select & open a file when no arg are provided
        file="$(fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup | fzf --height=70% --preview='bat -n --color=always --line-range :500 {}')"
        if [ -n "$file" ]; then
            nvim "$file"
        fi
    else
        # Handle when an arg is provided
        lines=$(zoxide query -l | xargs -I {} fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup -E .vscode "$1" {} | fzf --no-sort) # Initial filter attempt with fzf
        line_count="$(echo "$lines" | wc -l | xargs)" # Trim any leading spaces

        if [ -n "$lines" ] && [ "$line_count" -eq 1 ]; then
            # looks for the exact ones and opens it
            file="$lines"
            nvim "$file"
        elif [ -n "$lines" ]; then
            # If multiple files are found, allow further selection using fzf and bat for preview
            file=$(echo "$lines" | fzf --query="$1" --height=70% --preview='bat -n --color=always --line-range :500 {}')
            if [ -n "$file" ]; then
                nvim "$file"
            fi
        else
            echo "No matches found." >&2
        fi
    fi
}

search_with_zoxdie "$@"
