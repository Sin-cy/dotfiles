#!/bin/bash

# Script to list recent files and open nvim using fzf
# set to an alias nlof in .zshrc

list_oldfiles() {
    # Get the oldfiles list from Neovim
    local oldfiles=($(nvim -u NONE --headless +'lua io.write(table.concat(vim.v.oldfiles, "\n") .. "\n")' +qa))
    # Filter invalid paths or files not found
    local valid_files=()
    for file in "${oldfiles[@]}"; do
        if [[ -f "$file" ]]; then
            valid_files+=("$file")
        fi
    done
    # Use fzf to select from valid files
    local files=($(printf "%s\n" "${valid_files[@]}" | \
        grep -v '\[.*' | \
        fzf --multi \
        --preview 'bat -n --color=always --line-range=:500 {} 2>/dev/null || echo "Error previewing file"' \
        --height=70% \
        --layout=default))

    # Open selected files in Neovim
    if [[ ${#files[@]} -gt 0 ]]; then
        # make neovim recognize path of the file opened
        local first_dir=$(dirname "${files[0]}")
        cd "$first_dir" || { echo "Failed to cd to $first_dir"; return 1; }
        nvim "${files[@]}"
    fi
}

# Call the function
list_oldfiles "$@"
