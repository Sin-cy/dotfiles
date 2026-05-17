eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG=en_US.UTF-8

#------------All PATHS------------
# GNU coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Add local ~/scripts to the PATH
export PATH="$HOME/scripts:$PATH"

# Mason
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# 010 Hex Editor
export PATH="$PATH:/Applications/010 Editor.app/Contents/CmdLine" #ADDED BY 010 EDITOR

# Console Ninja
export PATH=~/.console-ninja/.bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"

# export ZSH_THEME="powerlevel10k/powerlevel10k"

# bun
# bun completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

#------------Langs------------

# Golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin

# Deno
. "/Users/personal/.deno/env"

# Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

