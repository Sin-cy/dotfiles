# My dotfiles

This directory contains the dotfiles for my mac system which probably won't work on yours.

# Install with Script
- Using install.sh script
- optional: Install xcode beforehand (already setup in script) `xcode-select --install`
    - `git clone https://github.com/Sin-cy/dotfiles.git $HOME/dotfiles` this repo into $HOME
    - `cd dotfiles` and make install.sh executable `chmod +x ~/dotfiles/install.sh`
    which ever way possible
    - run in shell `bash ~/dotfiles/install.sh` or `~/dotfiles/install.sh` 

# Manual Install
## Repository and Installations needed

### Install Homebrew

- Install homebrew.

- `curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`

- Execute the script with the bash command
    `/bin/bash install.sh`

Enter your password and proceed yes to confirm the installation if it prompts you to

#### Homebrew extras required
- `brew install eza fzf fd stow bat zoxide zsh-autosuggestions
zsh-syntax-highlighting git`

#### fzf-git
- `git clone https://github.com/junegunn/fzf-git.sh.git`

### Tmux
Installation
- `brew install tmux`

Tmux plugins manager
- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Git

If not already installed in the home directory

-   Check this by running `git --version` in the shell to see if the command is available
-   If not, it will most likely prompt you to install it but make sure Xcode Command Line tools is installed.

##### Install Git with Homebrew ( My Default ) 
- Manually Install git with Homebrew `brew install git`
- brew installs git on mac at `/usr/local/bin/git`

##### Install Git via Xcode
-   Install Xcode usign `xcode-select --install`
-   xcode installs git at `/usr/bin/git`


### GNU Stow
- Refer the docs : [Read More](https://www.gnu.org/software/stow/)
```
brew install stow
```
#### Update path in rc file with using GNU Stow

-   already have .zshrc file ready to go
-   If not ,then just to make sure this path below is added to .zshrc

```
# Add Homebrew's executable directory to the front of the PATH in .zshrc
export PATH=/usr/local/bin:$PATH
```

-   then in your shell `source ~/.zshrc`

## Installation of this repo using stow

First, check out dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:Sin-cy/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks(make sure you are in your dotfiles directory)

```
stow .

or

search for the stow command to make sure again
```
