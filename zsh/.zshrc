# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#echo source ~/.bash_profile



export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Go Path
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin

# Path to your oh-my-zsh installation.
# NOTE : Disabled : Currently using Starship
export ZSH="$HOME/.oh-my-zsh"


# NOTE: Disabled powerlevel10k 
# Using Starship instead of p10k
#ZSH_THEME="powerlevel10k/powerlevel10k"

# HACK: zsh plugins
plugins=(
    git 
    zsh-autosuggestions
    zsh-syntax-highlighting
    web-search
)

source $ZSH/oh-my-zsh.sh

# Starship 
eval "$(starship init zsh)"
# set Starship PATH
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# NOTE: Zoxide
eval "$(zoxide init zsh)"
# Finds every single file and opens in neovim
search_with_zoxdie() {
    if [ -z "$1" ]; then
        # No parameter provided, use fzf to select a file interactively
        file="$(fd --type f -I -H -E .git -E .git-crypt | fzf-tmux -p -w 80% -h 60% --preview='bat --style=plain --color=always {}')"
        if [ -n "$file" ]; then
            nvim "$file"
        fi
    else
        # Handle when an argument is provided
        lines=$(zoxide query -l | xargs -I {} fd --type f -I -H -E .git -E .git-crypt "$1" {} | fzf --no-sort) # Initial filter attempt with fzf
        line_count="$(echo "$lines" | wc -l | xargs)"                                  # Trim any leading spaces

        if [ -n "$lines" ] && [ "$line_count" -eq 1 ]; then
            # If exactly one match is found, open it
            file="$lines"
            nvim "$file"
        elif [ -n "$lines" ]; then
            # If multiple files are found, allow further selection using fzf and bat for preview
            file=$(echo "$lines" | fzf-tmux -p --query="$1" -w 80% -h 60% --preview='bat --style=plain --color=always {}')
            if [ -n "$file" ]; then
                nvim "$file"
            fi
        else
            echo "No matches found." >&2
        fi
    fi
}



# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --color=hl:#2dd4bf"
export FZF_TMUX_OPTS=" -p80%,70%"


# FZF with git right in the shell
# Keymaps for this is available in fzf-git.sh github repo
source ~/fzf-git.sh/fzf-git.sh

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
    esac
}

# Function to search up most recent open/history files, select and open to edit in nvim
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
      --preview 'bat --style=numbers --color=always --line-range=:500 {} 2>/dev/null || echo "Error previewing file"' \
      --preview-window=right:50%:wrap \
      --height=65% \
      --layout=reverse))

  # Open selected files in Neovim
  [[ ${#files[@]} -gt 0 ]] && nvim "${files[@]}"
}

#User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
#

# Console Ninja
PATH=~/.console-ninja/.bin:$PATH


# These alias need to have the same exact space as written here
# HACK: For Running Go Server using Air
alias air='$(go env GOPATH)/bin/air'

# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias t="tmux"
alias tn="(){tmux new -s $1}"
alias f="fzf"
alias fman="compgen -c | fzf | xargs man"

# Eza a better ls 
# brew install eza
# available no options : --no-filesize --no-time --no-permissions
alias ls="eza --color=always --long --icons=always --no-user" 

# aliases for git
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit -m'
alias gplog='git log --oneline --graph --all'

#lazygit
alias lg="lazygit"
# fzf 
alias nlof="list_oldfiles"
# zoxide
alias nzo="search_with_zoxdie"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
