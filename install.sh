#!/bin/bash

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## install zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
## install zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

## Formulae
echo "Installing Brew Formulae..."
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
brew install --cask raycast
brew install --cask karabiner-elements
brew install --cask wezterm
brew install --cask aerospace
brew install --cask keycastr
brew install --cask betterdisplay
brew install --cask linearmouse
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro

## MacOS settings
echo "Changing macOS defaults..."
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write InitialKeyRepeat -int 10

csrutil status
echo "Installation complete..."

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone git@github.com:Sin-cy/dotfiles.git $HOME/dotfiles
fi

# Navigate to dotfiles directory
cd $HOME/dotfiles || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow aerospace karabiner nvim starship wezterm tmux zsh

echo "Dotfiles setup complete!"

