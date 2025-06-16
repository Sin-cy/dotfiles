# export PATH=$HOME/bin:/usr/local/bin:$PATH
#echo source ~/.bash_profile

eval "$(brew shellenv)"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Add local ~/scripts to the PATH
export PATH="$HOME/scripts:$PATH"

export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

export TMUX_CONF=~/.config/tmux/tmux.conf

# Set XDG config home
export XDG_CONFIG_HOME="$HOME/.config"

# NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Go Path
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin

# Path to your oh-my-zsh installation.
# NOTE : Disabled Shell Prompt: Currently using Starship
# NOTE: using oh-my-zsh only for zsh plugins management
export ZSH="$HOME/.oh-my-zsh"

if [[ -o interactive ]]; then
  fastfetch
fi

# NOTE: Disabled powerlevel10k 
# Using Starship instead of p10k
#ZSH_THEME="powerlevel10k/powerlevel10k"

# HACK: zsh plugins
plugins=(
    git 
    ## with oh-my-zsh and not homebrew
    # zsh-autosuggestions ( git clone <find link in the repo> and uncomment  )
    # zsh-syntax-highlighting ( git clone <find link in the repo> and uncomment )
    web-search
)

source $ZSH/oh-my-zsh.sh


# Starship 
eval "$(starship init zsh)"
# set Starship PATH
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# NOTE: Zoxide
eval "$(zoxide init zsh)"

# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "  

# FZF with Git right in the shell by Junegunn : check out his github below
# Keymaps for this is available at https://github.com/junegunn/fzf-git.sh
source ~/scripts/fzf-git.sh

# Atuin Configs
eval "$(atuin init zsh)"
# Keybinding to start Atuin in Insert Mode
bindkey '^r' atuin-search-viins  # Ctrl-r starts Atuin in Insert mode

#User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Console Ninja
PATH=~/.console-ninja/.bin:$PATH


# These alias need to have the same exact space as written here
# HACK: For Running Go Server using Air
alias air='$(go env GOPATH)/bin/air'

# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias vim="nvim"

# Tmux 
alias tmux="tmux -f $TMUX_CONF"
alias a="attach"
# calls the tmux new session script
alias tns="~/scripts/tmux-sessionizer"

# fzf 
# called from ~/scripts/
alias nlof="~/scripts/fzf_listoldfiles.sh"
# opens documentation through fzf (eg: git,zsh etc.)
alias fman="compgen -c | fzf | xargs man"

# zoxide (called from ~/scripts/)
alias nzo="~/scripts/zoxide_openfiles_nvim.sh"

# Next level of an ls 
# options :  --no-filesize --no-time --no-permissions 
alias ls="eza --no-filesize --long --color=always --icons=always --no-user" 

# tree
alias tree="tree -L 3 -a -I '.git' --charset X "
alias dtree="tree -L 3 -a -d -I '.git' --charset X "

# git aliases
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit -m'
alias glog='git log --oneline --graph --all'
alias gh-create='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'

alias nvim-scratch="NVIM_APPNAME=nvim-scratch nvim"

# lazygit
alias lg="lazygit"

# obsidian icloud path
alias sethvault="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/sethVault/"

# unbind ctrl g in terminal
bindkey -r "^G"

# brew installations activation (new mac systems brew path: opt/homebrew , not usr/local )
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# bun completions
[ -s "/Users/personal/.bun/_bun" ] && source "/Users/personal/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine" #ADDED BY 010 EDITOR

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
. "/Users/personal/.deno/env"
