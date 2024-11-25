# My dotfiles

This directory contains the dotfiles for my mac system which probably won't work on yours.

# Install with Script

Run the following
- optional: Install xcode command line tools beforehand `xcode-select --install`
    - Install brew  
        - `sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

    - `brew install git`
    - `git clone https://github.com/Sin-cy/dotfiles.git $HOME/dotfiles` this repo into $HOME
    - `cd dotfiles` and make install.sh executable `chmod +x ~/dotfiles/install.sh`
    which ever way possible
    - run in shell `/bin/bash ~/dotfiles/install.sh` 

# Manual Install
## Repository and Installations needed

### Install Command Line Tools 
- `xcode-select --install`

### Install Homebrew

- Install homebrew.

- `sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Enter your password and proceed yes to confirm the installation if it prompts you to

#### Homebrew extras required
- `brew install neovim eza fzf fd stow bat zoxide zsh-autosuggestions
zsh-syntax-highlighting git starship tmux nvm`
    - If Mason lsp starts shouting when opening neovim
    - do nvm install node v23.3.0 or v-xx-xx

#### fzf-git
- `git clone https://github.com/junegunn/fzf-git.sh.git`

### Tmux
Installation
- `brew install tmux`

Tmux plugins manager
- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Git

-   Check this by running `git --version` in the shell to see if the command is available
-   it will most likely prompt you to install it with Xcode Command Line tools.
    - (Skip this step if command line tools already installed)

##### Install Git with Homebrew ( My Default ) 
- Manually Install git with Homebrew `brew install git`
- brew installs git on mac at `/opt/homebrew/bin/git`

##### Install Git via Xcode
-   Install Xcode usign `xcode-select --install`
-   xcode installs git at `/usr/bin/git`


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
