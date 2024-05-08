# Tweaking Ubuntu for programming

These are the steps required to tweak Ubuntu for making a better programming
environment.

## Install Ubuntu Requirement Package
All the required debian packages to setup the environment for Linux can be found
in `requirements.list`.
```bash
cat requirements.list | xargs sudo apt-get -y install
```
Optional packages for the `chromium-browser`, multimedia packages can be found
in `optional.list`
```bash
cat optional.list | xargs sudo apt-get -y install
```

## Clone this repository
```bash
git clone https://github.com/seshagiriprabhu/system_Scripts.git
```

## Setting up zsh
### Oh-my-zsh

`oh-my-zsh` is an open source, community-driven framework for managing your ZSH
configuration. Thanks to robbyrussel for maintaining the repository

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
 To install custom plugins for ZSH
```bash
cd ~/.oh-my-zsh/
git submodule update --init
```
I have included a copy of my `zshrc` in this repo. You can copy it into your
home folder
```zsh
cp zshrc ~/.zshrc
```
I have made litte changes in `arvindsrajtheme.zsh`, if you don't like the
default one, you could use my modified one:
```zsh
cp arvindsraj.zsh-theme ~/.oh-my-zsh/themes/   
```
You can choose a theme from `~/.oh-my-zsh/themes` and update in the `~/.zshrc`

### Install auto suggestions and highlight

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

You could make `/usr/bin/zsh` as your default shell of terminal (make changes
in the profile of your terminal)

## Setting up vim
### Setting up Neobundle
NeoBundle is a Vim plugin manager.
```zsh
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
```
Copy the `vimrc` file from this repo to home folder.
```zsh
cp vimrc ~/.vimrc
```
open `vim` and type `y` to install the plugins mentioned in the `vimrc`.

### Install YouCompleteMe
An autocompleter for vim. Lets compile it. You may have to install a
dependency `cmake`,
```zsh
sudo apt-get install cmake build-essential python-dev python3-dev vim-nox
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
Copy `ycm_extra_conf.py` to your home folder to enable autocompleter.
```zsh
cp ycm_extra_conf.py ~/.ycm_extra_conf.py
```

## Setting up pythonrc
Copy `pythonrc` file to your home directory not to display all the unwanted
welcome messages
upon opening a `python` interactive shell.
```zsh
cp pythonrc ~/.pythonrc
```