
NOTE:
> This config is only for macwork worktree branch for mac work machine
> **!! DO NOT MERGE THIS TO MAIN !!**

# My dotfiles
This directory contains the dotfiles for my mac system which probably won't work on yours.


# Manual Install
## Repository and Installations needed

### Install Command Line Tools 
- `xcode-select --install`

### Install Homebrew


#### Homebrew extras required
- `brew install neovim eza fzf fd stow bat zoxide zsh-autosuggestions
zsh-syntax-highlighting git starship tmux nvm`
    - If Mason lsp starts shouting when opening neovim
    - do nvm install node v23.3.0 or v-xx-xx


### Tmux
Installation
- `brew install tmux`

Tmux plugins manager
- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Git

-   Check this by running `git --version` in the shell to see if the command is available
-   it will most likely prompt you to install it with Xcode Command Line tools.
    - (Skip this step if command line tools already installed)



### GNU Stow
- Refer the docs : [Read More](https://www.gnu.org/software/stow/)
```
brew install stow
```

## Installation of this repo using stow

First, check out dotfiles repo in your $HOME directory using git

```
$ git clone https://github.com/Sin-cy/dotfiles.git
$ cd dotfiles
```
#### Before Running any stow commands
- At least for this config structure
- **!! make sure home directories is set to have the same structure first !!**
- for instances ( Watch for Sub-directories ) 
    - if any subdirectory eg: `~/.config` dont exist in $HOME then `mkdir .config`
    - other config files that don't exist in $HOME atm, should not have any problems
      for stow symlinks


then use GNU stow to create symlinks
> [!IMPORTANT]
> make sure you are in your dotfiles directory

- `cd dotfiles`
- as long as you have the structure setup in $HOME correctly
- running `stow .` should be enough

##### However, for assurance
- run stow commands like below for each directory in dotfiles 
- re-check if the symlinks are correct for each sub-directories and files
```bash
stow -t ~ starship wezterm tmux

#or run them separately

stow -t ~ nvim
stow -t ~ zsh
```
