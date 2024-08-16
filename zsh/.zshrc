
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#echo source ~/.bash_profile
#

# Set CLICOLOR if you want Ansi Colors in iTerm2 
#export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
#export TERM=xterm-256color



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


# NOTE: Disabled : Currently trying out Warp Terminal for now 
# Using Starship instead of p10k
#ZSH_THEME="powerlevel10k/powerlevel10k"

#ZSH_HIGHLIGHT_STYLES[command]='fg=049'
#ZSH_HIGHLIGHT_STYLES[builtin]='fg=049'


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

# FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --color=hl:#2dd4bf"
export FZF_TMUX_OPTS=" -p80%,70%"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

# FZF with git right in the shell
# Keymaps for this is available in fzf-git.sh github repo
source ~/fzf-git.sh/fzf-git.sh

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

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
# For Running Go Server using Air
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
alias ga="git add ."
alias gs="git status -s"
alias gc="(){git commit -m $1}"

# logitech g hub fix
alias ghub-kill="sudo kill \$(ps aux | grep lghub | grep -v grep | awk '{print \$2}');"
alias ghub='open /Applications/lghub.app/Contents/MacOS/lghub_agent.app; open /Applications/lghub.app/Contents/MacOS/lghub_updater.app; open /Applications/lghub.app;'



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
