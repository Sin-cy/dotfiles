#!/bin/bash

set -euo pipefail

echo "--- Starting dotfiles installation ---"

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
        echo "Complete the GUI prompt if it appears, then rerun the script."
        exit 0
    fi
fi

# Install oh-my-zsh
## install zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
## install zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
   echo "✅ Oh My Zsh already installed"
fi

# Homebrew
## Install
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

brew analytics off
brew update

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew install satococoa/tap/wtp
brew install anomalyco/tap/opencode

## Formulae
echo "Installing Brew Packages..."

## Core Utils
echo "Install gnu coreutils"
brew install coreutils

### Must Have things
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install stow
brew install fzf
brew install bat
brew install fd
brew install zoxide
brew install lua
brew install luajit
brew install luarocks
brew install prettier
brew install make
brew install qmk
brew install ripgrep
brew install joshmedeski/sesh/sesh

### Terminal
brew install git
brew install lazygit
brew install tmux
brew install neovim
brew install starship
brew install tree-sitter
brew install tree
brew install borders

### dev things
brew install node
brew install nvm
brew install sqlite

## Casks
echo "Brew Installing --cask..."
brew install --cask ghostty
brew install --cask raycast
brew install --cask karabiner-elements
brew install --cask wezterm
brew install --cask nikitabobko/tap/aerospace
brew install --cask keycastr
brew install --cask betterdisplay
brew install --cask linearmouse
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro

## MacOS settings
echo "Changing macOS defaults..."
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write InitialKeyRepeat -int 15
killall Dock &>/dev/null || true

csrutil status
echo "Installation complete..."

# Clone dotfiles repository
if [[ ! -d "$HOME/dotfiles" ]]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/Sin-cy/dotfiles.git "$HOME/dotfiles"
else
    echo "✅ Dotfiles already cloned, pulling latest..."
    cd "$HOME/dotfiles" && git pull
fi

# export gnu coreutils to path
echo 'export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.zshrc 2>/dev/null || true

# Navigate to dotfiles directory
echo "Stowing dotfiles..."
cd $HOME/dotfiles || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow -R -t ~ aerospace karabiner nvim starship ghostty wezterm tmux zsh fastfetch atuin mpd sketchybar scripts

echo "Dotfiles setup complete!"

