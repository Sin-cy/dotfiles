# My dotfiles

This directory contains the dotfiles for my mac system which probably won't work on yours.

## Repository and brew installations needed

`brew install eza fzf fd stow bat zoxide`
`git clone https://github.com/junegunn/fzf-git.sh.git`

### for Tmux

`brew install tmux`
tmux plugins manager
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## Requirements

Ensure you have the following installed.

### Git

If not already installed in the home directory

-   Check this by running `git --version` in the shell to see if the command is available
-   If not, it will most likely prompt you to install it but make sure Xcode Command Line tools is installed.
-   Install Xcode usign `xcode-select --install`

```
git
```

#### Installing Homebrew

-   Install homebrew
    `curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`

-   Execute the script with the bash command
    `/bin/bash install.sh`

Enter your password and proceed yes to confirm the installation

#### With using GNU Stow

-   already has a .zshrc ready to go

-   If not ,then just to make sure this path is added to .zshrc if not already added

```
# Add Homebrew's executable directory to the front of the PATH in .zshrc
export PATH=/usr/local/bin:$PATH
```

-   then `source ~/.zshrc`

### GNU Stow

```
brew install stow
```

## Installation of this repo using stow

First, check out dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:Sin-cy/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks(make sure you are in your dotfiles directory)

```
$ stow .

or

search for the stow command to make sure again
```
