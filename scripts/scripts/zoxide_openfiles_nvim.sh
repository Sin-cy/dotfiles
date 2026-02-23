#!/bin/bash

# Script to find every single file and opens in neovim
# alias set as nzo in .zshrc
search_with_zoxide() {
    if [ -z "$1" ]; then
        # no arg search files in current dir with fd + fzf preview
        file="$(fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup | fzf --height=70% --preview='bat -n --color=always --line-range :500 {}')"
        if [ -n "$file" ]; then
            dir="$(dirname "$file")"
            file_name="$(basename "$file")"
            cd "$dir" || { echo "Failed to cd to $dir" >&2; exit 1; }
            nvim "$file_name"
        fi
    else
        # with arg search for pattern in zoxide tracked dirs
        lines=""
        while IFS= read -r zdir; do
            found=$(fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup -E .vscode "$1" "$zdir" 2>/dev/null)
            if [ -n "$found" ]; then
                lines="$lines$found\n"
            fi
        done < <(zoxide query -l)
        lines="${lines%?}"  #trim trailing newline

        if [ -z "$lines" ]; then
            echo "No matches found." >&2
            return
        fi

        line_count="$(echo "$lines" | wc -l | xargs)"
        if [ "$line_count" -eq 1 ]; then
            file="$lines"
        else
            file="$(echo -e "$lines" | fzf --query="$1" --height=70% --preview='bat -n --color=always --line-range :500 {}' --no-sort)"
        fi

        if [ -n "$file" ]; then
            dir="$(dirname "$file")"
            file_name="$(basename "$file")"
            cd "$dir" || { echo "Failed to cd to $dir" >&2; exit 1; }
            nvim "$file_name"
        fi
    fi
}

search_with_zoxide "$@"
